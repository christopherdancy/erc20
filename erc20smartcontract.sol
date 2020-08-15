pragma solidity >0.5.2;
import "https://github.com/OpenZeppelin/zeppelin-solidity/contracts/math/SafeMath.sol";

contract erc20Example{
    
    //Use safeMath
    using SafeMath for uint256;
    
    //varibales
        string public exampleToken;
        string public EXT;
        mapping(address => uint256) balances;
        uint256 _totalSupply;
        event Transfer(address indexed from, address indexed to, uint tokens);
        //set total supply at the deployment of contract
        constructor(uint256 total) public {
           _totalSupply = total;
           balances[msg.sender] = _totalSupply;
        }
    
    //functions
        //Getter function - Total Supply  
        function totalSupply() public view returns (uint256) {
          return _totalSupply;
        }
        //getter Function - address to balance
        function balanceOf(address tokenOwner) public view returns (uint) {
          return balances[tokenOwner];
        }
        //transfer value to another address
        function transfer(address receiver, uint numTokens) public returns (bool) {
            //require the sender owns the number of tokens they are sending
            require(numTokens <= balances[msg.sender]);
            balances[msg.sender] = balances[msg.sender].sub(numTokens);
            balances[receiver] = balances[receiver].add(numTokens);
          emit Transfer(msg.sender, receiver, numTokens);
          return true;
        }
}
