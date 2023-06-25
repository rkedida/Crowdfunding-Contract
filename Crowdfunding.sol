pragma solidity ^0.8.17;
contract CrowdFunding{
    mapping (address => uint) public Contributors;
    address public Manager;
    uint public minContribution;
    uint public deadline;
    uint public target;
    uint public raiseAmount;
    uint public noOfContributors;

struct Requests{
    string description;
    address payable recipient;
    uint value;
    bool isCompleted;
    uint noOfVoters;
    mapping(address=>bool) voters;
}

mapping (uint=>Requests) public requests;
    uint public numRequests;

    constructor(uint _target, uint _deadline){
        target = _target;
        deadline = block.timestamp + _deadline;
        minContribution = 100 wei;
        Manager = msg.sender;
    }
    function sendEth() public payable{
        require(block.timestamp < deadline, "deadline has been passed");
        require(msg.value >= 100 wei, "Minimum Contibution is not met");

        if(Contributors[msg.sender] == 0){
            noOfContributors++;
        }
        Contributors[msg.sender] += msg.value;
        raiseAmount += msg.value;
    }
    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }
    function refund() public{
        require(block.timestamp > deadline && raiseAmount < target);
        require(Contributors[msg.sender] > 0);
        address payable user = payable(msg.sender);
        user.transfer(Contributors[msg.sender]);
        Contributors[msg.sender] = 0;
    }
    modifier onlyManager(){
        require(msg.sender == Manager, "only manager can call this function");
        _;
    }
    function createRequest(string memory _description, address payable _recipient, uint _value) public onlyManager{
        Requests storage newRequest = requests[numRequests];
        numRequests++;
        newRequest.description = _description;
        newRequest.recipient = _recipient;
        newRequest.value = _value;
        newRequest.isCompleted = false;
        newRequest.noOfVoters = 0;
    }
    function voteRequest(uint _requestNo) public{
        require(Contributors[msg.sender] > 0, "yu are not a contributor");
        Requests storage thisRequest = requests[_requestNo];
        require(thisRequest.voters[msg.sender] == false, "you have aready voted");
        thisRequest.voters[msg.sender] = true;
        thisRequest.noOfVoters++;
    }
    function makePayment(uint _requestNo) public onlyManager{
        require(raiseAmount >= target);
        Requests storage thisRequest = requests[_requestNo];
        require(thisRequest.isCompleted == false, "Already distributed the amount");
        require(thisRequest.noOfVoters > noOfContributors/2, "majority support marks not crossed");
        thisRequest.recipient.transfer(thisRequest.value);
        thisRequest.isCompleted = true;
    }
}