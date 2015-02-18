<?php
namespace PhalconRest\Controllers;
use \PhalconRest\Exceptions\HTTPException,
    PhalconRest\Models\Patients as Patients,
    PhalconRest\Models\CareTeams as CareTeams,
    PhalconRest\Models\Answers as Answers,
	PhalconRest\Models\PatientProviders as PatientProviders,
	PhalconRest\Models\EventVisits as EventVisits,
	PhalconRest\Models\PhaseQuestions as PhaseQuestions;

use Swagger\Annotations as SWG;

/**
 * @package
 * @category
 * @subpackage
 *
 * @SWG\Resource(
 *   apiVersion="1.0.0",
 *   swaggerVersion="1.2",
 *   basePath="http://killzombieswith.us/aii-api/v1",
 *   resourcePath="/patients",
 *   description="Requests about Patient Information",
 *   produces="['application/json','application/xml','text/plain']"
 * )
 */


class PatientsController extends RESTController{
    
    
    /**
     * Sets which fields may be searched against, and which fields are allowed to be returned in
     * partial responses.
     * @var array
     */
    protected $allowedFields = array(
        'search' => array('PatientID','First','Last','DOB','Sex','BMI','Height',
                          'Weight'),
        'partials' => array('PatientID','First','Last','DOB','Sex','BMI','Height',
                          'Weight')
    );

    
    /**
     * @SWG\Api(
     *   path="/patients/",
     *   @SWG\Operation(
     *     method="GET",
     *     summary="Retrieve patient set",
     *     notes="Returns all patients",
     *     type="Patient",
     *     nickname="getAllPatients",
     *     @SWG\ResponseMessage(code=404, message="Patients not found")
     *   )
     * )
     */
    public function get($token){
        
        //Currently can only get all patients if there is an active session in sessions log table
        $isActive = TokenConverter::isTokenActive($token);
		if(is_array($isActive) && isset($isActive['error'])){
            return $isActive;
        }
        
        //if active, can do search, sort, or get on all records
        if($this->isSearch){
            $results = $this->search();
        } else if ($this->isSorted){
            $result = Patients::query()
                ->order($this->sortFields)
                ->execute();
            $results = $result->toArray();
        }else{
            $result = Patients::find();
            $results = $result->toArray();
        }
        
        return $this->respond($results);
    }
    
    
    /**
     * @SWG\Api(
     *   path="/patients/{id}/{token}",
     *   @SWG\Operation(
     *     method="GET",
     *     summary="Find patient by ID",
     *     notes="Returns a patient based on ID",
     *     type="Patient",
     *     nickname="getPatient",
     *     @SWG\Parameter(
     *       name="patientID",
     *       description="ID of patient that needs to be fetched",
     *       required=true,
     *       type="integer",
     *       format="int64",
     *       paramType="path",
     *       minimum="1.0",
     *       maximum="100000.0"
     *     ),
     *     @SWG\ResponseMessage(code=400, message="Invalid ID supplied"),
     *     @SWG\ResponseMessage(code=404, message="Patient not found")
     *   )
     * )
     */
    public function getOne($patientID, $token){
        
        //Get User's FacilityID from the token
		$facilityID = TokenConverter::get($token, "FacilityID");
        //If the token is invalid, return a record of false
		if(is_array($facilityID) && isset($facilityID['error'])){
			return $facilityID;
		}
        
        $isViewablePatient = PatientProviders::findFirst(array(
            "conditions" => "FacilityID = $facilityID AND  PatientID = $patientID"
        ));
        
        if(!$isViewablePatient){
            $response['error'] = "Access to this patient is not permitted";
            return $response;
        }
        
        $result = Patients::findFirst("PatientID='{$patientID}'");
        if(!$result){
            return "Patient not found";
        }
        return $result->toArray();
    }
    
    /**
     * @SWG\Api(
     *   path="/patients/{id}/{token}",
     *   @SWG\Operation(
     *     method="GET",
     *     summary="Find patient by ID",
     *     notes="Returns a patient based on ID",
     *     type="Patient",
     *     nickname="getPatient",
     *     @SWG\Parameter(
     *       name="patientID",
     *       description="ID of patient that needs to be fetched",
     *       required=true,
     *       type="integer",
     *       format="int64",
     *       paramType="path",
     *       minimum="1.0",
     *       maximum="100000.0"
     *     ),
     *     @SWG\ResponseMessage(code=400, message="Invalid ID supplied"),
     *     @SWG\ResponseMessage(code=404, message="Patient not found")
     *   )
     * )
     */
    public function getPatientAndFacility($patientID, $token){
        
        //Get User's FacilityID from the token
		$facilityID = TokenConverter::get($token, "FacilityID");
        //If the token is invalid, return a record of false
		if(is_array($facilityID) && isset($facilityID['error'])){
			return $facilityID;
		}
        
        //Check to see if patient is in a careteam with user's facility
        $isPatientProvider = PatientProviders::findFirst(array(
            "conditions" => "FacilityID = {$facilityID} AND  PatientID = {$patientID}"
        ));
<<<<<<< HEAD
        
        //print_r($isPatientProvider);
        
=======

        print_r($isPatientProvider);

>>>>>>> d04b231582d7cde7941dc56319fb58f9c41a0d0b
        if(!$isPatientProvider){
            $response['error'] = "Access to this patient is not permitted";
            return $response;
        }
        
        //if patient is in user's careteam, grab the user's facility information
        $userFacility = $isPatientProvider->getFacility();
        $result["Facility"] = $userFacility->toArray();
        
        //grab the patient's information
        $result["Patient"] = Patients::findFirst("PatientID='{$patientID}'")->toArray();
        if(!$result["Patient"]){
            return "Patient not found";
        }
        //var_dump($result);
        return $result;
    }
    
    
    //Added by Terry, comment later ... It's late and I'm on a roll
    public function getPatientEverything($patientID, $eventID, $token){
        //Get User's FacilityID from the token
		$facilityID = TokenConverter::get($token, "FacilityID");
        //If the token is invalid, return a record of false
		if(is_array($facilityID) && isset($facilityID['error'])){
			return $facilityID;
		}
        
        $isPatientProvider = PatientProviders::findFirst(array(
            "conditions" => "FacilityID = $facilityID AND  PatientID = $patientID"
        ));
        
        
        if(!$isPatientProvider){
            $response['error'] = "Access to this patient is not permitted";
            return $response;
        }
        $userFacility = $isPatientProvider->getFacility();
        $result["Facility"] = $userFacility->toArray();
        
        $patient = Patients::findFirst("PatientID='{$patientID}'");
        $result["Patient"] = $patient->toArray();
        if(!$result["Patient"]){
            return "Patient not found";
        }
        
        $event = $patient->getPatientCareTeams(array("conditions" => "CareTeamID=$eventID"))->toArray();
        if($event[0]){
            $result["Event"] = $event[0];
        }else{
            $result["Event"] = "Event not found or does not belong to patient";
        }
        
        
        return $result;
    }
    
    
    /**
     * @SWG\Api(
     *   path="/patients/",
     *   @SWG\Operation(
     *     method="POST",
     *     summary="Create a patient record",
     *     notes="Insert a patient into patients table",
     *     type="Patient",
     *     nickname="postPatient",
     *     @SWG\ResponseMessage(code=???, message=" ")
     *   )
     * )
     */
    public function post($token){
	
	    //Get FacilityID from the token
		$facilityID = TokenConverter::get($token, "FacilityID");
        //If the token is invalid, return a record of false
		if(is_array($facilityID) && isset($facilityID['error'])){
			return $facilityID;
		}
		
        $patient = new Patients(); //create new instance of Patients model (aka a new record) - patients model represents table
    
        $patientForm = $this->di->get('requestBody');  //call requestBody in index to grab json 
                                                //requestBody returns contents to $pati

        foreach($patientForm as $key => $value)
        {
            $patient->$key= $value;
        }
		$patient->InactiveStatus = 10;
        
        
        $patient->save();
		if ($patient->save() == true) {
            $responseMessage = "Successfully added a patient";
        } else {
            $responseMessage = "Sorry, the following problems were generated: \n";
            foreach ($patient->getMessages() as $message) {
                $responseMessage = $responseMessage . $message->getMessage() . ".\n";
            }
			return $responseMessage;
        }
        
        
        $patientCareTeam = new CareTeams();
        
        $patientCareTeam->PatientID=$patient->PatientID;
        $patientCareTeam->OriginalFacilityID=$facilityID;
        $patientCareTeam->CurrentPhaseID=20;
        $patientCareTeam->Description="N/A";
        $patientCareTeam->CreatedOn=time();
        $patientCareTeam->LastVisit=time();
        $patientCareTeam->save();
		
        if (!$patientCareTeam->save()) {
			echo "Sorry, the following problems were generated: \n";
            foreach ($patientCareTeam->getMessages() as $message) {
                echo $message->getMessage() . ".\n";
            }
            return;
        }else{
            //Save not answered or N/a for all questions initially
		    $allQuestions = PhaseQuestions::find();
            foreach($allQuestions as $phaseQuestion){
                $question = $phaseQuestion->getQuestion();
                if($question->QuestionID < 81 || $question->QuestionID > 84 &&
                       !($question->QuestionID > 202 && $question->QuestionID <207) && //left and right electrode, processor,implant types
                       !($question->QuestionID > 212 && $question->QuestionID <217)){
                    $answ = new Answers();
                        $answ->PhaseID = $phaseQuestion->PhaseID;
                        $answ->CareTeamID = $patientCareTeam->CareTeamID;
                        $answ->QuestionID = $question->QuestionID;
                        $answ->FacilityID= $patientCareTeam->OriginalFacilityID;
                        $answ->Timestamp= time();
                    if($question->AnswerTypeID !=3 && $question->QuestionID != 202 && $question->QuestionID != 212 && $question->QuestionID > 46){
                        
                        //checkboxes
                        if($question->AnswerTypeID == 4){
                            $answ->Text= json_encode("Not Answered");
                        }else{
                            $answ->Text= "Not Answered";
                        }
                        
                    }else{
                        $answ->Text= "N/A";
                    }
                    $answ->save();
                }
			}
		}    
        
		$patientProviders = new PatientProviders();
		
		$patientProviders->save(array(
			"PatientID" => $patient->PatientID,
			"FacilityID" => $facilityID
		));
		
		if (!$patientProviders->save()) {
			return;
        }
        
        $answersA = new Answers();
        
        $answersA->save(array(
            "PhaseID" => 1,
            "CareTeamID" => $patientCareTeam->CareTeamID,
			"FacilityID" => $facilityID,
            "QuestionID" => 10,
            "Text" => $patient->DOB,
			"Timestamp" => time()
        ));
        
        $answersB = new Answers();
        
        $answersB->save(array(
            "PhaseID" => 1,
            "CareTeamID" => $patientCareTeam->CareTeamID,
			"FacilityID" => $facilityID,
            "QuestionID" => 20,
            "Text" => $patient->Sex,
			"Timestamp" => time()
        ));
        
        $answersC = new Answers();
        
        $answersC->save(array(
            "PhaseID" => 1,
            "CareTeamID" => $patientCareTeam->CareTeamID,
			"FacilityID" => $facilityID,
            "QuestionID" => 30,
            "Text" => $patient->Race,
			"Timestamp" => time()
        ));
        
        $eventDemogVisit = new EventVisits();
        
        $eventDemogVisit->save(array(
            "EventID" => $patientCareTeam->CareTeamID,
            "1TS" =>time()
        ));
        
		return $responseMessage;
       
    }

    public function delete($id){
        $patient = Patients::findFirst("PatientID='{$id}'");
        
        $patient->IsArchived = true;
        
        
        $patient->update();
        
        if ($patient->update() == true) {
            return "Successfully soft-deleted a patient";
        } else {
            $error = "Sorry, the following problems were generated: ";
            foreach ($patient->getMessages() as $message) {
                $error =  $error .  $message->getMessage() . ", ";
            }
            return $this->respond($error);
        }
    }

    /**
     * @SWG\Api(
     *   path="/patients/",
     *   @SWG\Operation(
     *     method="PUT",
     *     summary="Edit a patient record",
     *     notes="Edit an existing patient in patients table",
     *     type="Patient",
     *     nickname="putPatient",
     *     @SWG\ResponseMessage(code=???, message=" ")
     *   )
     * )
     */
    public function put($id, $token){
        $isActive = TokenConverter::isTokenActive($token);
		if(is_array($isActive) && isset($isActive['error'])){
            return $isActive;
        }
        
        $patient = Patients::findFirst("PatientID='{$id}'");
        
        $patientEdit = $this->di->get('requestBody');  //call requestBody in index to grab json object from front end
                                                //requestBody returns contents to $patientEdit
      
        //for each edited field(key), change it in patient record.
        foreach($patientEdit as $key => $value)
        {
            $patient->$key= $value;
        }
        
        
        $patient->update();
        
        if ($patient->update() == true) {
            return "Successfully edited a patient";
        } else {
            $error = "Sorry, the following problems were generated: ";
            foreach ($patient->getMessages() as $message) {
                $error =  $error .  $message->getMessage() . ", ";
            }
            return $this->respond($error);
        }
       
       // return array('Put / stub');
    }

    public function patch($id){
        return array('Patch / stub');
    }

    public function search(){
        $records = Patients::find();
        $records = $records->toArray();
        $results = array();
        foreach($records as $record){
            $match = true;
            foreach ($this->searchFields as $field => $value) {
                if(!(strpos(strtolower($record[$field]), strtolower($value)) !== FALSE)){
                    $match = false;
                }
            }
            if($match){
                $results[] = $record;
            }
        }

        return $results;
    }


}
