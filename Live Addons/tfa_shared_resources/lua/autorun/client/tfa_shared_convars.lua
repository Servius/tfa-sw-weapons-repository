-- Toggle dynamic lighting on blaster bolts
if !ConVarExists("cl_dynamic_tracer") then
    CreateClientConVar("cl_dynamic_tracer", 1, true, false, "Enable/Disable dynamic lighting on Star Wars weapons")
end