{
  inputs = { xps = { url = "path:./xps"; }; };
  outputs = { xps, ... }@inputs: { inherit xps; };
}
