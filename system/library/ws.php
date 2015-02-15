<?PHP
class Ws{
	private $_client;
	private $cdyne_client;
	
	public function __construct(){
		ini_set("soap.wsdl_cache_enabled", 0);

		$this->_client = new SoapClient('http://ec.europa.eu/taxation_customs/vies/checkVatService.wsdl', array('soap_version' => SOAP_1_1));

		$this->cdyne_client = new SoapClient('http://wsf.cdyne.com/WeatherWS/Weather.asmx?WSDL', array('soap_version' => SOAP_1_1));

	}
	
	public function checkVAT($country_code, $vat_number){
		$data = array(
			'countryCode'	=> $country_code, 
			'vatNumber'		=> $vat_number
		);
		
		$result = $this->_client->checkVat($data);
		
		return $result;
	}
	
	public function getWeather($zip){
		$params = new SoapVar('<GetCityWeatherByZIP xmlns="http://ws.cdyne.com/WeatherWS/"><ZIP>'.$zip.'</ZIP></GetCityWeatherByZIP>', XSD_ANYXML);

		return $this->cdyne_client->GetCityWeatherByZIP($params);
	}
	public function getWeatherInfo($zip){
		$params = new SoapVar('<GetCityWeatherByZIP xmlns="http://ws.cdyne.com/WeatherWS/"><ZIP>'.$zip.'</ZIP></GetCityWeatherByZIP>', XSD_ANYXML);

		return $this->cdyne_client->GetWeatherInformation($params);
	}
        
	public function getFunctions($client){
		
                return $this->$client->__getFunctions();
	}
        
}
?>