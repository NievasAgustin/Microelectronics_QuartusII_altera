module full_adder ( input logic a, b, cin,
                    output logic s, cout);
 logic xor_a_b;
 logic and_cin_xor;
 logic and_a_b;
 
 xor(s, xor_a_b, cin);
 xor(xor_a_b, a, b);
 and(and_cin_xor, cin, xor_a_b);
 and(and_a_b, a, b);
 or(cout, and_a_b, and_cin_xor);
endmodule
