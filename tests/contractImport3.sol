import * as foo from "contractImport4.sol";

contract map {
	mapping(uint=>uint) someMapping;
	function getMappingElement(uint a) returns (uint) {
		return someMapping[a];
	}
}