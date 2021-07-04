using AtiyahBott

# first test
println( "Testing O1" )
P = (g,c,w,s,m) -> AtiyahBott.O1(g,c,w,s,m)^2
res = AtiyahBott.AtiyahBottFormula(2,2,6-1,P)
if res[1] == 1//1 
    println( "O1 test passed" )
else
    error( "O1 test failed" )
end

#second test
println( "Testing Incidency and Contact" )
d = 4
P = Vector{Any}(undef, d+1)
for a in 0:d
    P[a+1] = (g,c,w,s,m) -> AtiyahBott.Incidency(g,c,w,s,3)^a*
        AtiyahBott.Incidency(g,c,w,s,2)^(2*(d-a)+1)*
        AtiyahBott.Contact(g,c,w,s)
end
res = AtiyahBottFormula(3,d,0,P);

if res == [ 1089024, 96512, 9408, 1024, 128 ] 
    println( "Incidency and Contact test passed" )
else
    error( "Incidency and Contact test failed" )
end

#third test
println( "Testing Hypersurface" )
d = 4 #for other values of d, change this line
P = (g,c,w,s,m) -> AtiyahBott.Hypersurface(g,c,w,s,5)
res = AtiyahBottFormula(4,d,0,P);

if res == [ 15517926796875//64 ] 
    println( "Hyppersurface test passed" )
else
    error( "Hypersurface test failed" )
end

#fourth test
println( "Testing R1" )
d = 5 #for other values of d, change this line
P = (g,c,w,s,m) -> AtiyahBott.R1(g,c,w,s,1)^2
res = AtiyahBottFormula(1,d,0,P)

if res == [ 1//125 ]
    println( "R1 test passed" )
else
    error( "R1 test failed" )
end
