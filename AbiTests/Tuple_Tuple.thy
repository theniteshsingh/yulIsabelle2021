theory Tuple_Tuple imports "../AbiTypes" "../Hex"

begin

(* solidity *)

(* solidity *)

(*
pragma experimental ABIEncoderV2;

struct uints0 {
    uint256 i01;
    uint256 i02;
}

struct uints1 {
    uints0 i11;
    uints0 i12;
    uints0 i13;
}
 
 contract C {
    function getEncoding() external returns (bytes memory) {
        uints1 memory x = uints1(uints0(42, 43), uints0(44, 44), uints0(44, 45));
        return abi.encode(x);
    }
}
*)

(* hex output *)

(*
0x0000000000000000000000000000000000000000000000000000000000000029000000000000000000000000000000000000000000000000000000000000002a000000000000000000000000000000000000000000000000000000000000002a000000000000000000000000000000000000000000000000000000000000002b000000000000000000000000000000000000000000000000000000000000002b000000000000000000000000000000000000000000000000000000000000002c
*)



end