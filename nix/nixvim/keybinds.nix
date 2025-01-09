{ ... }:
{
programs.nixvim.keymaps = [
  {
    action = "h";
    key = "b";
    options.remap = true;
  }
  {
    action = "j";
    key = "n";
    options.remap = true;
  }
  {
    action = "k";
    key = "r";
    options.remap = true;
  }
  {
    action = "l";
    key = "s";
    options.remap = true;
  }
  {
    action = "b";
    key = "ä";
    options.noremap = true;
  }
  {
    action = "n";
    key = "ö";
    options.noremap = true;
  }
  {
    action = "r";
    key = "ü";
    options.noremap = true;
  }
  {
    action = "R";
    key = "Ü";
    options.noremap = true;
  }
  {
    action = "<C-r>";
    key = "<C-Ü>";
    options.noremap = true;
  }
  {
    action = "l";
    key = "ß";
    options.noremap = true;
  }
];
}
    

  




