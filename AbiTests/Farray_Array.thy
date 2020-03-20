theory Farray_Array imports "../Hex" "../AbiTypes" "../AbiDecode" "../AbiEncode" "../AbiTypesSyntax" begin

(* solidity *)

(*

 pragma experimental ABIEncoderV2;

 contract C {
    uint256 [] [3] x;
    uint256 [] x1;
    uint256 [] x2;
    uint256 [] x3;
    function getEncoding() external returns (bytes memory) {
        
        x1.push(uint256(2)); x1.push(uint256(3));
        x3.push(uint256(40)); x3.push(uint256(41)); x3.push(uint256(42));
        x[0] = x1;
        x[1] = x2;
        x[2] = x3;
        return abi.encode(x);
    }
}
*)

(* hex output (raw) *)
(*
{
	"0": "bytes: 0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000c000000000000000000000000000000000000000000000000000000000000000e00000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300000000000000000000000000000000000000000000000000000000000000280000000000000000000000000000000000000000000000000000000000000029000000000000000000000000000000000000000000000000000000000000002a"
}
*)

(* hex output (trimmed) *)

(*
000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000c000000000000000000000000000000000000000000000000000000000000000e00000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300000000000000000000000000000000000000000000000000000000000000280000000000000000000000000000000000000000000000000000000000000029000000000000000000000000000000000000000000000000000000000000002a
*)

definition test_in :: "8 word list" where
"test_in = hex_splits ''000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000c000000000000000000000000000000000000000000000000000000000000000e00000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300000000000000000000000000000000000000000000000000000000000000280000000000000000000000000000000000000000000000000000000000000029000000000000000000000000000000000000000000000000000000000000002a''"

definition test_schema :: abi_type where
"test_schema = ABI_TYPE\<guillemotleft>Tuint256 [] [3]\<guillemotright>"

definition test_out :: "abi_value" where
"test_out = Vfarray (Tarray Tuint256) 3
            [(Varray (Tuint256) (map (Vuint 256)[2, 3])),
             (Varray (Tuint256) []),
             (Varray (Tuint256) (map (Vuint 256) [40, 41, 42]))]" 

value "decode test_schema test_in = Ok test_out"

value "encode test_out = Ok test_in"
end
