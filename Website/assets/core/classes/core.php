<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once 'init.php';

class CORE
{

	private $conn;

	public function __construct()
	{
		$database = new Database();
		$db = $database->dbConnection();
		$this->conn = $db;
  }

	public function runQuery($sql)
	{
		$stmt = $this->conn->prepare($sql);
		return $stmt;
	}

	public function isIngelogd()
	{
		if(isset($_SESSION['userSession']))
		{
			$stmt = $this->conn->prepare("SELECT * FROM gebruikers WHERE id=:id");
			$stmt->execute(array(":id"=>$_SESSION['userSession']));
			$userRow = $stmt->fetch(PDO::FETCH_ASSOC);
			if ($stmt->rowCount() == 1) {
				return true;
			} else {
				$this->loguit();
				return false;
			}
		} else {
			return false;
		}
	}

	public function redirect($url)
	{
		header("Location: $url");
	}

	public function loguit()
	{
		session_unset();
		session_destroy();
		$_SESSION['userSession'] = false;
	}

	public function login($bsn, $code)
	{
		$stmt = $this->conn->prepare("SELECT gebruikers.id as gebruiker FROM gebruikers INNER JOIN codes ON gebruikers.id = codes.uID WHERE gebruikers.bsn=:bsn AND codes.code=:code;");
		$stmt->bindparam(":bsn",$bsn);
		$stmt->bindparam(":code",$code);
		$stmt->execute();
		$PS = $stmt->fetchAll(PDO::FETCH_ASSOC);
		if ($stmt->rowCount() != 1) {
			return false;
		} else {
      $_SESSION['userSession'] = $PS[0]["gebruiker"];
			return true;
		}
	}

	public function krijgGebruikerInformatie() {
		$stmt = $this->conn->prepare("SELECT IF(ISNULL(tussenvoegsels),CONCAT(voornaam,' ',achternaam),CONCAT(voornaam,' ',tussenvoegsels,' ',achternaam)) as naam, gemeenten.naam as gemeente FROM gebruikers INNER JOIN gemeenten ON gebruikers.gemeente = gemeenten.id");
		$stmt->execute();
		$PS = $stmt->fetchAll(PDO::FETCH_ASSOC);
		if ($stmt->rowCount() == 0) {
			return false;
		} else {
			return $PS;
		}
	}

	public function heeftGestemt($gebruikerID)
	{
		$stmt = $this->conn->prepare("SELECT uID FROM stemmen WHERE uID=:gebruikerID;");
		$stmt->execute(array(":gebruikerID"=>$gebruikerID));
		$stmt->execute();
		$PS = $stmt->fetchAll(PDO::FETCH_ASSOC);
		if ($stmt->rowCount() == 0) {
			return false;
		} else {
			return true;
		}
	}

	public function stemOpPartij($gebruikerID, $partijId) {
		$stmt = $this->conn->prepare("INSERT INTO apps (name, category, uID, packageName, versionName, versionCode, permissionList, firebaseLink) VALUES (:name,:category,:uID,:packageName,:versionName,:versionCode,:appPermissions,:firebaseLink);");
		$stmt->bindparam(":gebruikerID",$gebruikerID);
		$stmt->bindparam(":partijId",$partijId);
		$stmt->execute();
		return $this->lastID();
	}

	public function krijgPartijen() {
		$stmt = $this->conn->prepare("SELECT * FROM partijen");
		$stmt->execute();
		$PS = $stmt->fetchAll(PDO::FETCH_ASSOC);
		if ($stmt->rowCount() == 0) {
			return false;
		} else {
			return $PS;
		}
	}

	public function krijgPartijenVanGemeenteId($gemeenteId) {
		$stmt = $this->conn->prepare("SELECT * FROM partijen WHERE gemeente = :gemeenteId");
		$stmt->execute(array(":gemeenteId"=>$gemeenteId));
		$PS = $stmt->fetchAll(PDO::FETCH_ASSOC);
		if ($stmt->rowCount() == 0) {
			return false;
		} else {
			return $PS;
		}
	}

	public function krijgStemresulatenVanGemeenteId($gemeenteId) {
		$stmt = $this->conn->prepare("SELECT COUNT(stemmen.uID) as stemmen, partijen.naam as partijNaam, partijen.afkorting as partijAfkorting FROM stemmen INNER JOIN partijen ON stemmen.partij = partijen.id INNER JOIN gebruikers ON stemmen.uID = gebruikers.id INNER JOIN gemeenten ON gebruikers.gemeente = gemeenten.id WHERE gemeenten.id = :gemeenteId GROUP BY stemmen.partij");
		$stmt->execute(array(":gemeenteId"=>$gemeenteId));
		$PS = $stmt->fetchAll(PDO::FETCH_ASSOC);
		if ($stmt->rowCount() == 0) {
			return false;
		} else {
			return $PS;
		}
	}

	public function krijgGemeenten() {
		$stmt = $this->conn->prepare("SELECT * FROM gemeenten");
		$stmt->execute();
		$PS = $stmt->fetchAll(PDO::FETCH_ASSOC);
		if ($stmt->rowCount() == 0) {
			return false;
		} else {
			return $PS;
		}
	}

	public function partijIdNaarNaam($id) {
		$stmt = $this->conn->prepare("SELECT name FROM partijen WHERE id=:id");
		$stmt->execute(array(":id"=>$id));
		$PS = $stmt->fetchAll(PDO::FETCH_ASSOC);
		if ($stmt->rowCount() != 1) {
			return null;
		} else {
			return $PS[0]["name"];
		}
  }
}

?>
