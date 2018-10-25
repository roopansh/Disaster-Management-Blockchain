pragma solidity ^0.4.20;

contract WorkbenchBase {
    event WorkbenchContractCreated(string applicationName, string workflowName, address originatingAddress);
    event WorkbenchContractUpdated(string applicationName, string workflowName, string action, address originatingAddress);

    string internal ApplicationName;
    string internal WorkflowName;

    function WorkbenchBase(string applicationName, string workflowName) internal {
        ApplicationName = applicationName;
        WorkflowName = workflowName;
    }

    function ContractCreated() internal {
        WorkbenchContractCreated(ApplicationName, WorkflowName, msg.sender);
    }

    function ContractUpdated(string action) internal {
        WorkbenchContractUpdated(ApplicationName, WorkflowName, action, msg.sender);
    }
}

contract MedicalRecordsLedger is WorkbenchBase('MedicalRecordsLedger', 'MedicalRecordsLedger') {
    enum StateType { DiseaseDiagnosed, PendingApprovalDiagnosis, ApprovedDiagnosis, DiseaseTreated, PendingApprovalTreatment}

    //List of properties
    StateType public State;
    address public  ReportingDoctor;
    address public  TreatingDoctor;
    address public  AuthorisingDoctor;
    address public  Patient;

    string public Disease;
    string public Hospital;
    string public ReportLink;
    string public Comments;

    // constructor function
    function MedicalRecordsLedger(string disease, string reportLink, string hospital, string comments, address patient) public
    {
        ReportingDoctor = msg.sender;
        Disease = disease;
        Hospital = hospital;
        ReportLink = reportLink;
        Comments = comments;
        Patient = patient;
        State = StateType.DiseaseDiagnosed;
        ContractCreated();
    }

    function ReportDisease(string disease) public
    {
        if (ReportingDoctor != msg.sender)
        {
            revert();
        }

        Disease = disease;
        State = StateType.DiseaseDiagnosed;

        // call ContractUpdated() to record this action
        ContractUpdated('ReportDisease');
    }

    function UserConfirmationDiagnosis() public
    {
        if(Patient != msg.sender){
            revert();
        }

        // call ContractUpdated() to record this action
        State = StateType.PendingApprovalDiagnosis;
        ContractUpdated('UserConfirmationDiagnosis');
    }

    function ApproveDiagnosis() public
    {
        AuthorisingDoctor = msg.sender;

        // call ContractUpdated() to record this action
        State = StateType.ApprovedDiagnosis;
        ContractUpdated('ApproveDiagnosis');
    }

    function TreatDisease(string comments) public
    {
        TreatingDoctor = msg.sender;
        Comments = comments;
        State = StateType.DiseaseTreated;

        // call ContractUpdated() to record this action
        ContractUpdated('TreatDisease');
    }

    function UserConfirmationTreatment() public
    {
        if(Patient != msg.sender){
            revert();
        }

        // call ContractUpdated() to record this action
        State = StateType.PendingApprovalTreatment;
        ContractUpdated('UserConfirmationTreatment');
    }

    function ApproveTreatment() public
    {
        AuthorisingDoctor = msg.sender;

        // call ContractUpdated() to record this action
        State = StateType.ApprovedDiagnosis;
        ContractUpdated('ApproveTreatment');
    }
}
