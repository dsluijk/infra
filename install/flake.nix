{
  inputs = { zinc = { url = "path:./zinc"; }; };
  outputs = { zinc, ... }@inputs: { inherit zinc; };
}
