<?php

class DatabaseService
{

    private static $connection = null;
    private static $query;
    //hier verbinden we de database
    public static function Connect($hostname, $database, $username, $password)
    {
        self::$connection = @new mysqli($hostname, $username, $password);
        //als niet verbonden....
        if (self::$connection->connect_errno)
        {
           die("Failed to connect to MySQL: (" . self::$connection->connect_errno . ") " . self::$connection->connect_error);
        }
        self::$connection->select_db($database) or die('I cannot select a database.');
        self::$connection->set_charset("utf8");
    }
    //database selecteren
    public static function SelectDB($database)
    {
        self::$connection->select_db($database) or die('I cannot select a database.');
    }
    //niet verbonden Exception
    private static function _NoConnection()
    {
        if (self::$connection == null)
        {
            throw new Exception("There is no database connection.");
        }
    }
    // database sluiten
    public static function Close()
    {
        self::_NoConnection();
        self::$connection->close();
    }
    //standaard query uitvoeren
    public static function Query($sql, $nofetch = false, $num_rows = false, $field_count = false, $field_name = false, $insert_id = false)
    {
        self::_NoConnection();
        $sqldata = array();
        self::_InternalQuery($sql);
        //check welke props gegeven zijn
        if($insert_id)
        {
            $sqldata['insert_id'] = self::$connection->insert_id;
        }
        
        if(!$nofetch || $num_rows)
        {
            while($array = self::_FetchArray(self::$query))
            {
                $sqldata['fetch'][] = $array;
            }
            
            if($num_rows)
            {
                $sqldata['num_rows'] = self::$query->num_rows;
                $sqldata['affected_rows'] = self::$connection->affected_rows;
            }
            
            if(!$field_count && !$field_name)
            {
                self::$query->free();
            }
        }
        
        if($field_count || $field_name)
        {
            if($field_count)
            {
                $sqldata['field_count'] = self::_FieldCount(self::$query);

            }
            
            if($field_name)
            {
                $sqldata['field_name'] = self::_FieldName(self::$query);
            }
            
            self::$query->free();
        }
        
        if(is_array($sqldata['fetch']) && !$nofetch && !$num_rows && !$field_count && !$field_name && !$insert_id)
        {
            return $sqldata['fetch'];
        }
                
        return $sqldata;
    }
    //query result tellen
    public static function QueryCount($sql)
    {
        self::_NoConnection();
        self::_InternalQuery($sql);
        $querycount = self::$query->num_rows;
        
        // clear memory
        self::$query->free();
        
        return $querycount;
    }
    //prive query voor functies
    private static function _InternalQuery($sql)
    {
        self::_NoConnection();
        self::$query = self::$connection->query($sql);

        if (self::$query === false)
        {
            die("<p>" . self::$connection->error . " <strong>SQL Query: $sql</strong></p>");
        }
    }
    //array ophalen uit de database
    public static function _FetchArray()
    {
        $array = self::$query->fetch_assoc();
        return $array;
    }
    //prive teller voor functies
    private static function _FieldCount()
    {
        return self::$query->field_count;
    }
    //veld namen ophalen
    public static function _FieldName()
    {
        $finfo = self::$query->fetch_fields();
        
//        $mysql_data_type_hash = array(
//                                1=>'tinyint',
//                                2=>'smallint',
//                                3=>'int',
//                                4=>'float',
//                                5=>'double',
//                                7=>'timestamp',
//                                8=>'bigint',
//                                9=>'mediumint',
//                                10=>'date',
//                                11=>'time',
//                                12=>'datetime',
//                                13=>'year',
//                                16=>'bit',
//                                252=> "blob", // is currently mapped to all text and blob types (MySQL 5.0.51a)
//                                253=>'varchar',
//                                254=>'char',
//                                246=>'decimal'
//                            );
        
        $mysql_data_type_hash = array(
                                1=>'flipswitch',
                                2=>'text',
                                3=>'text',
                                4=>'text',
                                5=>'text',
                                7=>'text',
                                8=>'text',
                                9=>'text',
                                10=>'date',
                                11=>'text',
                                12=>'date',
                                13=>'text',
                                16=>'text',
                                252=> "textarea", // is currently mapped to all text and blob types (MySQL 5.0.51a)
                                253=>'text',
                                254=>'text',
                                246=>'text'
                            );
        
        
        // convert type int to text
        foreach($finfo AS $key => $val)
        {
            $val = get_object_vars($val);
            $finfoArr[$val['name']] = $val;
            if($mysql_data_type_hash[$val['type']])
            {
                $finfoArr[$val['name']]['type'] = $mysql_data_type_hash[$val['type']];
                
                // alleen tinyint wordt flipswitch, maar in case dat de length 1 is bij een int, mag het ook een flipswitch worden
                if($val['type'] == 3 && $val['length'] == 1)
                {
                    $finfoArr[$val['name']]['type'] = $mysql_data_type_hash[1];
                }
            }
        }
        
        return $finfoArr;
    }
    //beveiliging tegen injecties
    public static function StripInjection($var)
    {
        self::_NoConnection();
        
        if (is_array($var))
        {
            foreach ($var AS $k => $v)
            {
                // recursive!
                if (is_array($v))
                {
                    $var[$k] = self::StripInjection($v);
                }
                else
                {
                    $var[$k] = self::$connection->real_escape_string($v);
                }
            }
            return $var;
        }
        else
        {
            return self::$connection->real_escape_string($var);
        }
    }

}

?>
