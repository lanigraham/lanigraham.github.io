## lib/ritex/mathml/entities.rb -- MathML conversions of TeX
## entities. See Ritex::MathML.
##
## Author::    William Morgan (mailto: wmorgan-ritex@masanjin.net)
## Copyright:: Copyright 2005 William Morgan
## License::   GNU GPL version 2

## The main module for everything Ritex-related. See Ritex::Parser.
module Ritex

## As many MathML-specific aspected of Ritex are stored in this module
## as possible. Note that the rdoc documentation for this module is woefully
## incorrect because we programmatically modify the globals in this package.
module MathML

## Default entities, mostly stolen from
## http://www.orcca.on.ca/mathml/texmml/texmml.xml. We overwrite many
## of these below.
DEFAULTS = {
  "{" => "<mo>{</mo>",
  "}" => "<mo>}</mo>",
  "Vert" => "<mo>&#x2225;</mo>",
  "vert" => "<mo>&#x2223;</mo>",
  "lbrack" => "<mo>[</mo>",
  "lbrace" => "<mo>{</mo>",
  "lfloor" => "<mo>&#x230A;</mo>",
  "lceil" => "<mo>&#x2308;</mo>",
  "langle" => "<mo>&#x2329;</mo>",
  "lgroup" => "<mo>(</mo>",
  "rbrack" => "<mo>]</mo>",
  "rbrace" => "<mo>}</mo>",
  "backslash" => "<mo>\\</mo>",
  "rfloor" => "<mo>&#x230B;</mo>",
  "rceil" => "<mo>&#x2309;</mo>",
  "rangle" => "<mo>&#x232A;</mo>",
  "rgroup" => "<mo>)</mo>",
  "uparrow" => "<mo>&#x2191;</mo>",
  "Uparrow" => "<mo>&#x21D1;</mo>",
  "downarrow" => "<mo>&#x2193;</mo>",
  "Downarrow" => "<mo>&#x21D3;</mo>",
  "updownarrow" => "<mo>&#x21C5;</mo>",
  "Updownarrow" => "<mo>&#x21D5;</mo>",
  "leftarrow" => "<mo>&#x2190;</mo>",
  "gets" => "<mo>&#x2190;</mo>",
  "Leftarrow" => "<mo>&#x21D0;</mo>",
  "rightarrow" => "<mo>&#x2192;</mo>",
  "to" => "<mo>&#x2192;</mo>",
  "Rightarrow" => "<mo>&#x21D2;</mo>",
  "leftrightarrow" => "<mo>&#x21C6;</mo>",
  "Leftrightarrow" => "<mo>&#x21D4;</mo>",
  "mapsto" => "<mo>&#x21A6;</mo>",
  "hookleftarrow" => "<mo>&#x21A9;</mo>",
  "leftharpoonup" => "<mo>&#x21BC;</mo>",
  "leftharpoondown" => "<mo>&#x21BD;</mo>",
  "rightleftharpoons" => "<mo>&#x21CC;</mo>",
  "longleftarrow" => "<mo>&#x2190;</mo>",
  "Longleftarrow" => "<mo>&#x21D0;</mo>",
  "longrightarrow" => "<mo>&#x2192;</mo>",
  "Longrightarrow" => "<mo>&#x21D2;</mo>",
  "longleftrightarrow" => "<mo>&#x2194;</mo>",
  "Longleftrightarrow" => "<mo>&#x21D4;</mo>",
  "longmapsto" => "<mo>&#x21A6;</mo>",
  "leadsto" => "<mo>&#x21DD;</mo>",
  "hookrightarrow" => "<mo>&#x21AA;</mo>",
  "rightharpoonup" => "<mo>&#x21C0;</mo>",
  "rightharpoondown" => "<mo>&#x21C1;</mo>",
  "nearrow" => "<mo>&#x2197;</mo>",
  "searrow" => "<mo>&#x2198;</mo>",
  "swarrow" => "<mo>&#x2199;</mo>",
  "nwarrow" => "<mo>&#x2196;</mo>",
  "arrowvert" => "<mo>&#x2223;</mo>",
  "Arrowvert" => "<mo>&#x2225;</mo>",
  "bracevert" => "<mo mathvariant='bold'>&#x2223;</mo>",
  "lmoustache" => "<mo>&#x23B0;</mo>",
  "rmoustache" => "<mo>&#x23B1;</mo>",
  "leftarrowfill" => "<mo stretchy='true'>&#x2190;</mo>",
  "rightarrowfill" => "<mo stretchy='true'>&#x2192;</mo>",
  "iff" => "<mo>&#x21D4;</mo>",
  "dashrightarrow" => "<mo>&#x21E2;</mo>",
  "dashleftarrow" => "<mo>&#x21E0;</mo>",
  "leftleftarrows" => "<mo>&#x21C7;</mo>",
  "leftrightarrows" => "<mo>&#x21C6;</mo>",
  "Lleftarrow" => "<mo>&#x21DA;</mo>",
  "twoheadleftarrow" => "<mo>&#x219E;</mo>",
  "leftarrowtail" => "<mo>&#x21A2;</mo>",
  "looparrowleft" => "<mo>&#x21AB;</mo>",
  "leftrightharpoons" => "<mo>&#x21CB;</mo>",
  "curvearrowleft" => "<mo>&#x21B6;</mo>",
  "circlearrowleft" => "<mo>&#x21BA;</mo>",
  "Lsh" => "<mo>&#x21B0;</mo>",
  "upuparrows" => "<mo>&#x21C8;</mo>",
  "upharpoonleft" => "<mo>&#x21BF;</mo>",
  "downharpoonleft" => "<mo>&#x21C3;</mo>",
  "multimap" => "<mo>&#x22B8;</mo>",
  "leftrightsquigarrow" => "<mo>&#x21AD;</mo>",
  "rightrightarrows" => "<mo>&#x21C9;</mo>",
  "rightleftarrows" => "<mo>&#x21C4;</mo>",
  "twoheadrightarrow" => "<mo>&#x21A0;</mo>",
  "rightarrowtail" => "<mo>&#x21A3;</mo>",
  "looparrowright" => "<mo>&#x21AC;</mo>",
  "rightleftharpoons" => "<mo>&#x21CC;</mo>",
  "curvearrowright" => "<mo>&#x21B7;</mo>",
  "circlearrowright" => "<mo>&#x21BB;</mo>",
  "Rsh" => "<mo>&#x21B1;</mo>",
  "downdownarrows" => "<mo>&#x21CA;</mo>",
  "upharpoonright" => "<mo>&#x21BE;</mo>",
  "rightsquigarrow" => "<mo>&#x21DD;</mo>",
  "nleftarrow" => "<mo>&#x219A;</mo>",
  "nrightarrow" => "<mo>&#x219B;</mo>",
  "nLeftarrow" => "<mo>&#x21CD;</mo>",
  "nRightarrow" => "<mo>&#x21CF;</mo>",
  "nleftrightarrow" => "<mo>&#x21AE;</mo>",
  "nLeftrightarrow" => "<mo>&#x21CE;</mo>",
  "dotplus" => "<mo>&#x2214;</mo>",
  "smallsetminus" => "<mo>&#x2216;</mo>",
  "Cap" => "<mo>&#x22D2;</mo>",
  "Cup" => "<mo>&#x22D3;</mo>",
  "barwedge" => "<mo>&#x22BC;</mo>",
  "doublebarwedge" => "<mo>&#x2306;</mo>",
  "veebar" => "<mo>&#x22BB;</mo>",
  "boxminus" => "<mo>&#x229F;</mo>",
  "boxtimes" => "<mo>&#x22A0;</mo>",
  "boxdot" => "<mo>&#x22A1;</mo>",
  "boxplus" => "<mo>&#x229E;</mo>",
  "divideontimes" => "<mo>&#x22C7;</mo>",
  "ltimes" => "<mo>&#x22C9;</mo>",
  "rtimes" => "<mo>&#x22CA;</mo>",
  "leftthreetimes" => "<mo>&#x22CB;</mo>",
  "rightthreetimes" => "<mo>&#x22CC;</mo>",
  "curlywedge" => "<mo>&#x22CF;</mo>",
  "curlyvee" => "<mo>&#x22CF;</mo>",
  "circleddash" => "<mo>&#x229D;</mo>",
  "circledast" => "<mo>&#x229B;</mo>",
  "circledcirc" => "<mo>&#x229A;</mo>",
  "centerdot" => "<mo>&#x22C5;</mo>",
  "intercal" => "<mo>&#x22BA;</mo>",
  "digamma" => "<mo>&#x03DC;</mo>",
  "varkappa" => "<mo>&#x03F0;</mo>",
  "beth" => "<mo>&#x2136;</mo>",
  "daleth" => "<mo>&#x2138;</mo>",
  "gimel" => "<mo>&#x2137;</mo>",
  "ulcorner" => "<mo>&#x231C;</mo>",
  "urcorner" => "<mo>&#x231D;</mo>",
  "llcorner" => "<mo>&#x231E;</mo>",
  "lrcorner" => "<mo>&#x231F;</mo>",
  "leqq" => "<mo>&#x2266;</mo>",
  "leqslant" => "<mo>&#x2A7D;</mo>",
  "eqslantless" => "<mo>&#x2A95;</mo>",
  "lessapprox" => "<mo>&#x2A85;</mo>",
  "lesssim" => "<mo>&#x2272;</mo>",
  "approxeq" => "<mo>&#x224A;</mo>",
  "lessdot" => "<mo>&#x22D6;</mo>",
  "lll" => "<mo>&#x22D8;</mo>",
  "lessgtr" => "<mo>&#x2276;</mo>",
  "lesseqgtr" => "<mo>&#x22DA;</mo>",
  "lesseqqgtr" => "<mo>&#x2A8B;</mo>",
  "doteqdot" => "<mo>&#x2251;</mo>",
  "risingdotseq" => "<mo>&#x2253;</mo>",
  "fallingdotseq" => "<mo>&#x2252;</mo>",
  "backsim" => "<mo>&#x223D;</mo>",
  "backsimeq" => "<mo>&#x22CD;</mo>",
  "subseteqq" => "<mo>&#x2AC5;</mo>",
  "Subset" => "<mo>&#x22D0;</mo>",
  "sqsubset" => "<mo>&#x228F;</mo>",
  "preccurlyeq" => "<mo>&#x227C;</mo>",
  "curlyeqprec" => "<mo>&#x22DE;</mo>",
  "precsim" => "<mo>&#x227E;</mo>",
  "precapprox" => "<mo>&#x2AB7;</mo>",
  "vartriangleleft" => "<mo>&#x22B2;</mo>",
  "trianglelefteq" => "<mo>&#x22B4;</mo>",
  "Vvdash" => "<mo>&#x22AA;</mo>",
  "smallsmile" => "<mo>&#x2323;</mo>",
  "smallfrown" => "<mo>&#x2322;</mo>",
  "bumpeq" => "<mo>&#x224F;</mo>",
  "Bumpeq" => "<mo>&#x224E;</mo>",
  "geqq" => "<mo>&#x2267;</mo>",
  "geqslant" => "<mo>&#x2A7E;</mo>",
  "eqslantgtr" => "<mo>&#x2A96;</mo>",
  "eqslantgtr" => "<mo>&#x22DD;</mo>",
  "gtrsim" => "<mo>&#x2273;</mo>",
  "gtrapprox" => "<mo>&#x2A86;</mo>",
  "gtrdot" => "<mo>&#x22D7;</mo>",
  "ggg" => "<mo>&#x22D9;</mo>",
  "gtrless" => "<mo>&#x2277;</mo>",
  "gtreqless" => "<mo>&#x22DB;</mo>",
  "gtreqqless" => "<mo>&#x2A8C;</mo>",
  "eqcirc" => "<mo>&#x2256;</mo>",
  "circeq" => "<mo>&#x2257;</mo>",
  "triangleq" => "<mo>&#x225C;</mo>",
  "thicksim" => "<mo>&#x223C;</mo>",
  "supseteqq" => "<mo>&#x2AC6;</mo>",
  "thickapprox" => "<mo>&#x2248;</mo>",
  "Supset" => "<mo>&#x22D1;</mo>",
  "sqsupset" => "<mo>&#x2290;</mo>",
  "succcurlyeq" => "<mo>&#x227D;</mo>",
  "curlyeqsucc" => "<mo>&#x22DF;</mo>",
  "succsim" => "<mo>&#x227F;</mo>",
  "succapprox" => "<mo>&#x2AB8;</mo>",
  "vartriangleright" => "<mo>&#x22B3;</mo>",
  "trianglerighteq" => "<mo>&#x22B5;</mo>",
  "Vdash" => "<mo>&#x22A9;</mo>",
  "shortmid" => "<mo>&#x2223;</mo>",
  "shortparallel" => "<mo>&#x2225;</mo>",
  "between" => "<mo>&#x226C;</mo>",
  "pitchfork" => "<mo>&#x23D4;</mo>",
  "varpropto" => "<mo>&#x221D;</mo>",
  "blacktriangleleft" => "<mo>&#x25C0;</mo>",
  "therefore" => "<mo>&#x2234;</mo>",
  "backepsilon" => "<mo>&#x220B;</mo>",
  "blacktriangleright" => "<mo>&#x25B6;</mo>",
  "because" => "<mo>&#x2235;</mo>",
  "nless" => "<mo>&#x226E;</mo>",
  "nleq" => "<mo>&#x2270;</mo>",
  "lneq" => "<mo>&#x2A87;</mo>",
  "lneqq" => "<mo>&#x2268;</mo>",
  "lnsim" => "<mo>&#x22E6;</mo>",
  "lnapprox" => "<mo>&#x2A89;</mo>",
  "precnsim" => "<mo>&#x22E8;</mo>",
  "precnapprox" => "<mo>&#x2AB9;</mo>",
  "nsim" => "<mo>&#x2241;</mo>",
  "nmid" => "<mo>&#x2224;</mo>",
  "nvdash" => "<mo>&#x22AC;</mo>",
  "nvDash" => "<mo>&#x22AD;</mo>",
  "ntriangleleft" => "<mo>&#x22EA;</mo>",
  "ntrianglelefteq" => "<mo>&#x22EC;</mo>",
  "nsubseteq" => "<mo>&#x2288;</mo>",
  "subsetneq" => "<mo>&#x228A;</mo>",
  "subsetneqq" => "<mo>&#x2ACB;</mo>",
  "ntrianglelefteq" => "<mo>&#x22EC;</mo>",
  "ngtr" => "<mo>&#x226F;</mo>",
  "ngeq" => "<mo>&#x2271;</mo>",
  "gneq" => "<mo>&#x2A88;</mo>",
  "gneqq" => "<mo>&#x2269;</mo>",
  "gnsim" => "<mo>&#x22E7;</mo>",
  "gnapprox" => "<mo>&#x2A8A;</mo>",
  "succnsim" => "<mo>&#x22E9;</mo>",
  "succnapprox" => "<mo>&#x2ABA;</mo>",
  "ncong" => "<mo>&#x2247;</mo>",
  "nshortparallel" => "<mo>&#x2226;</mo>",
  "nparallel" => "<mo>&#x2226;</mo>",
  "nVDash" => "<mo>&#x22AF;</mo>",
  "ntriangleright" => "<mo>&#x22EB;</mo>",
  "ntrianglerighteq" => "<mo>&#x22ED;</mo>",
  "nsupseteq" => "<mo>&#x2289;</mo>",
  "nsupseteq" => "<mo>&#x2289;</mo>",
  "supsetneq" => "<mo>&#x228B;</mo>",
  "supsetneqq" => "<mo>&#x2ACC;</mo>",
  "hbar" => "<mo>&#x0127;</mo>",
  "hslash" => "<mo>&#x210F;</mo>",
  "vartriangle" => "<mo>&#x25B3;</mo>",
  "triangledown" => "<mo>&#x25BD;</mo>",
  "square" => "<mo>&#x25A1;</mo>",
  "lozenge" => "<mo>&#x25CA;</mo>",
  "circledS" => "<mo>&#x24C8;</mo>",
  "measuredangle" => "<mo>&#x2221;</mo>",
  "nexists" => "<mo>&#x2204;</mo>",
  "mho" => "<mo>&#x2127;</mo>",
  "Finv" => "<mo>&#x2132;</mo>",
  "backprime" => "<mo>&#x2035;</mo>",
  "varnothing" => "<mo>&#x00D8;</mo>",
  "blacktriangle" => "<mo>&#x25B2;</mo>",
  "blacktriangledown" => "<mo>&#x25BC;</mo>",
  "blacksquare" => "<mo>&#x25A0;</mo>",
  "blacklozenge" => "<mo>&#x25CA;</mo>",
  "bigstar" => "<mo>&#x2605;</mo>",
  "sphericalangle" => "<mo>&#x2222;</mo>",
  "complement" => "<mo>&#x2201;</mo>",
  "eth" => "<mo>&#x00F0;</mo>",
  "qed" => "<mo>&#x25A1;</mo>",
  "i" => "<mo>&#x0131;</mo>",
  "j" => "<mo>&#x006A;</mo>",
  "alpha" => "<mi>&#x03B1;</mi>",
  "beta" => "<mi>&#x03B2;</mi>",
  "gamma" => "<mi>&#x03B3;</mi>",
  "delta" => "<mi>&#x03B4;</mi>",
  "epsilon" => "<mi>&#x03B5;</mi>",
  "varepsilon" => "<mi>&#x03B5;</mi>",
  "zeta" => "<mi>&#x03B6;</mi>",
  "eta" => "<mi>&#x03B7;</mi>",
  "theta" => "<mi>&#x03B8;</mi>",
  "vartheta" => "<mi>&#x03D1;</mi>",
  "iota" => "<mi>&#x03B9;</mi>",
  "kappa" => "<mi>&#x03BA;</mi>",
  "lambda" => "<mi>&#x03BB;</mi>",
  "mu" => "<mi>&#x03BC;</mi>",
  "nu" => "<mi>&#x03BD;</mi>",
  "xi" => "<mi>&#x03BE;</mi>",
  "pi" => "<mi>&#x03C0;</mi>",
  "varpi" => "<mi>&#x03D6;</mi>",
  "rho" => "<mi>&#x03C1;</mi>",
  "varrho" => "<mi>&#x03F1;</mi>",
  "varsigma" => "<mi>&#x03C2;</mi>",
  "sigma" => "<mi>&#x03C3;</mi>",
  "tau" => "<mi>&#x03C4;</mi>",
  "upsilon" => "<mi>&#x03C5;</mi>",
  "phi" => "<mi>&#x03C6;</mi>",
  "varphi" => "<mi>&#x03D5;</mi>",
  "chi" => "<mi>&#x03C7;</mi>",
  "psi" => "<mi>&#x03C8;</mi>",
  "omega" => "<mi>&#x03C9;</mi>",
  "Gamma" => "<mi>&#x0393;</mi>",
  "Delta" => "<mi>&#x0394;</mi>",
  "Theta" => "<mi>&#x0398;</mi>",
  "Lambda" => "<mi>&#x039B;</mi>",
  "Xi" => "<mi>&#x039E;</mi>",
  "Pi" => "<mi>&#x03A0;</mi>",
  "Sigma" => "<mi>&#x03A3;</mi>",
  "Upsilon" => "<mi>&#x03A5;</mi>",
  "Phi" => "<mi>&#x03A6;</mi>",
  "Psi" => "<mi>&#x03A8;</mi>",
  "Omega" => "<mi>&#x03A9;</mi>",
  "varGamma" => "<mi>&#x0393;</mi>",
  "varDelta" => "<mi>&#x0394;</mi>",
  "varTheta" => "<mi>&#x0398;</mi>",
  "varLambda" => "<mi>&#x039B;</mi>",
  "varXi" => "<mi>&#x039E;</mi>",
  "varPi" => "<mi>&#x03A0;</mi>",
  "varSigma" => "<mi>&#x03A3;</mi>",
  "varUpsilon" => "<mi>&#x03A5;</mi>",
  "varPhi" => "<mi>&#x03A6;</mi>",
  "varPsi" => "<mi>&#x03A8;</mi>",
  "varOmega" => "<mi>&#x03A9;</mi>",
  "colon" => "<mo>:</mo>",
  "&" => "<mo>&amp;</mo>",
  "aleph" => "<mo>&#x2135;</mo>",
  "imath" => "<mo>&#x2373;</mo>",
  "jmath" => "<mo>&#x006A;</mo>",
  "ell" => "<mo>&#x2113;</mo>",
  "wp" => "<mo>&#x2118;</mo>",
  "Re" => "<mo>&#x211C;</mo>",
  "Im" => "<mo>&#x2111;</mo>",
  "prime" => "<mo>&#x2032;</mo>",
  "emptyset" => "<mo>&#x2205;</mo>",
  "nabla" => "<mo>&#x2207;</mo>",
  "surd" => "<mo>&#x221A;</mo>",
  "partial" => "<mo>&#x2202;</mo>",
  "top" => "<mo>&#x03A4;</mo>",
  "bot" => "<mo>&#x03A5;</mo>",
  "vdash" => "<mo>&#x22A2;</mo>",
  "dashv" => "<mo>&#x22A3;</mo>",
  "forall" => "<mo>&#x2200;</mo>",
  "exists" => "<mo>&#x2203;</mo>",
  "neg" => "<mo>&#x00AC;</mo>",
  "flat" => "<mo>&#x266D;</mo>",
  "natural" => "<mo>&#x266E;</mo>",
  "sharp" => "<mo>&#x266F;</mo>",
  "angle" => "<mo>&#x2220;</mo>",
  "Box" => "<mo>&#x25AB;</mo>",
  "Diamond" => "<mo>&#x25CA;</mo>",
  "triangle" => "<mo>&#x25B3;</mo>",
  "clubsuit" => "<mo>&#x2663;</mo>",
  "diamondsuit" => "<mo>&#x2666;</mo>",
  "heartsuit" => "<mo>&#x2665;</mo>",
  "spadesuit" => "<mo>&#x2660;</mo>",
  "Join" => "<mo>&#x22C8;</mo>",
  "infty" => "<mo>&#x221E;</mo>",
  "lnot" => "<mo>&#x2310;</mo>",
  "bull" => "<mo>&#x25AA;</mo>",
  "cents" => "<mo>&#x00A2;</mo>",
  "sum" => "<mo>&#x02211;</mo>",
  "prod" => "<mo>&#x220F;</mo>",
  "coprod" => "<mo>&#x2210;</mo>",
  "int" => "<mo>&#x222B;</mo>",
  "iint" => "<mo>&#x222C;</mo>",
  "iiint" => "<mo>&#x222D;</mo>",
  "iiiint" => "<mo>&#x2A0C;</mo>",
  "idotsint" => "<mo>&#x222B;</mo>",
  "oint" => "<mo>&#x222E;</mo>",
  "bigcap" => "<mo>&#x2229;</mo>",
  "bigcup" => "<mo>&#x222A;</mo>",
  "bigsqcup" => "<mo>&#x2294;</mo>",
  "bigvee" => "<mo>&#x22C1;</mo>",
  "bigwedge" => "<mo>&#x22C0;</mo>",
  "bigodot" => "<mo>&#x2299;</mo>",
  "bigotimes" => "<mo>&#x2297;</mo>",
  "bigoplus" => "<mo>&#x2295;</mo>",
  "biguplus" => "<mo>&#x228E;</mo>",
  "oe" => "<mo>&#x0153;</mo>",
  "OE" => "<mo>&#x0152;</mo>",
  "ae" => "<mo>&#x00E6;</mo>",
  "AE" => "<mo>&#x00C6;</mo>",
  "aa" => "<mo>&#x00E5;</mo>",
  "AA" => "<mo>&#x00C5;</mo>",
  "o" => "<mo>&#x00F8;</mo>",
  "O" => "<mo>&#x00D8;</mo>",
  "l" => "<mo>&#x0142;</mo>",
  "L" => "<mo>&#x0141;</mo>",
  "SS" => "<mo>&#x00DF;</mo>",
  "S" => "<mo>&#x00A7;</mo>",
  "copyright" => "<mo>&#x00A9;</mo>",
  "P" => "<mo>&#x00B6;</mo>",
  "pounds" => "<mo>&#x00A3;</mo>",
  "pm" => "<mo>&#x00B1;</mo>",
  "mp" => "<mo>&#x00B1;</mo>",
  "times" => "<mo>&#x00D7;</mo>",
  "div" => "<mo>&#x00F7;</mo>",
  "cdot" => "<mo>&#x22C5;</mo>",
  "ast" => "<mo>*</mo>",
  "star" => "<mo>&#x22C6;</mo>",
  "dagger" => "<mo>&#x2020;</mo>",
  "dag" => "<mo>&#x2020;</mo>",
  "ddagger" => "<mo>&#x2021;</mo>",
  "ddag" => "<mo>&#x2021;</mo>",
  "amalg" => "<mo>&#x2210;</mo>",
  "cap" => "<mo>&#x2229;</mo>",
  "cup" => "<mo>&#x222A;</mo>",
  "uplus" => "<mo>&#x228E;</mo>",
  "sqcap" => "<mo>&#x2293;</mo>",
  "sqcup" => "<mo>&#x2294;</mo>",
  "vee" => "<mo>&#x2228;</mo>",
  "wedge" => "<mo>&#x2227;</mo>",
  "oplus" => "<mo>&#x2295;</mo>",
  "ominus" => "<mo>&#x2296;</mo>",
  "otimes" => "<mo>&#x2297;</mo>",
  "oslash" => "<mo>&#x2298;</mo>",
  "odot" => "<mo>&#x2299;</mo>",
  "circ" => "<mo>&#x2218;</mo>",
  "bullet" => "<mo>&#x2219;</mo>",
  "diamond" => "<mo>&#x22C4;</mo>",
  "lhd" => "<mo>&#x22B2;</mo>",
  "rhd" => "<mo>&#x22B3;</mo>",
  "unlhd" => "<mo>&#x22B4;</mo>",
  "unrhd" => "<mo>&#x22B5;</mo>",
  "bigcirc" => "<mo>&#x25EF;</mo>",
  "bigtriangleup" => "<mo>&#x25B3;</mo>",
  "bigtriangledown" => "<mo>&#x25BD;</mo>",
  "triangleleft" => "<mo>&#x25C5;</mo>",
  "triangleright" => "<mo>&#x25BB;</mo>",
  "setminus" => "<mo>&#x2216;</mo>",
  "wr" => "<mo>&#x2240;</mo>",
  "lor" => "<mo>&#x2228;</mo>",
  "land" => "<mo>&#x2227;</mo>",
  "cdots" => "<mo>&#x22EF;</mo>",
  "ddots" => "<mo>&#x22F1;</mo>",
  "vdots" => "<mo>&#x22EE;</mo>",
  "ldots" => "<mo>&#x2026;</mo>",
  "dots" => "<mo>&#x22EF;</mo>",
  "dotsb" => "<mo>&#x22EF;</mo>",
  "dotsc" => "<mo>&#x2026;</mo>",
  "dotsi" => "<mo>&#x22EF;</mo>",
  "dotsm" => "<mo>&#x22EF;</mo>",
  "dotso" => "<mo>&#x22EF;</mo>",
  "=" => "<mo>=</mo>",
  "leq" => "<mo>&#x2264;</mo>",
  "le" => "<mo>&#x2264;</mo>",
  "ll" => "<mo>&#x226A;</mo>",
  "geq" => "<mo>&#x2265;</mo>",
  "ge" => "<mo>&#x2265;</mo>",
  "gg" => "<mo>&#x226B;</mo>",
  "ne" => "<mo>&#x2260;</mo>",
  "neq" => "<mo>&#x2260;</mo>",
  "doteq" => "<mo>&#x2250;</mo>",
  "subset" => "<mo>&#x2282;</mo>",
  "subseteq" => "<mo>&#x2286;</mo>",
  "sqsubseteq" => "<mo>&#x2291;</mo>",
  "supset" => "<mo>&#x2283;</mo>",
  "supseteq" => "<mo>&#x2287;</mo>",
  "sqsupseteq" => "<mo>&#x2292;</mo>",
  "in" => "<mo>&#x2208;</mo>",
  "ni" => "<mo>&#x220B;</mo>",
  "models" => "<mo>&#x22A7;</mo>",
  "perp" => "<mo>&#x22A5;</mo>",
  "approx" => "<mo>&#x2248;</mo>",
  "cong" => "<mo>&#x2245;</mo>",
  "equiv" => "<mo>&#x224D;</mo>",
  "propto" => "<mo>&#x221D;</mo>",
  "prec" => "<mo>&#x227A;</mo>",
  "preceq" => "<mo>&#x227C;</mo>",
  "parallel" => "<mo>&#x2225;</mo>",
  "sim" => "<mo>&#x223C;</mo>",
  "simeq" => "<mo>&#x2243;</mo>",
  "asymp" => "<mo>&#x224D;</mo>",
  "smile" => "<mo>&#x2323;</mo>",
  "frown" => "<mo>&#x2322;</mo>",
  "bowtie" => "<mo>&#x22C8;</mo>",
  "succ" => "<mo>&#x227B;</mo>",
  "succeq" => "<mo>&#x227D;</mo>",
  "mid" => "<mo>&#x2223;</mo>",
  "owns" => "<mo>&#x220B;</mo>",
  "notin" => "<mo>&#x2209;</mo>",
  "arccos" => "<mi>arccos</mi>",
  "arcsin" => "<mi>arcsin</mi>",
  "arctan" => "<mi>arctan</mi>",
  "arg" => "<mi>arg</mi>",
  "cos" => "<mi>cos</mi>",
  "cosh" => "<mi>cosh</mi>",
  "cot" => "<mi>cot</mi>",
  "coth" => "<mi>coth</mi>",
  "csc" => "<mi>csc</mi>",
  "deg" => "<mi>deg</mi>",
  "det" => "<mi>det</mi>",
  "dim" => "<mi>dim</mi>",
  "exp" => "<mi>exp</mi>",
  "gcd" => "<mi>gcd</mi>",
  "hom" => "<mi>hom</mi>",
  "inf" => "<mi>inf</mi>",
  "ker" => "<mi>ker</mi>",
  "lg" => "<mi>lg</mi>",
  "lim" => "<mi>lim</mi>",
  "liminf" => "<mi>lim inf</mi>",
  "limsup" => "<mi>lim sum</mi>",
  "ln" => "<mi>ln</mi>",
  "log" => "<mi>log</mi>",
  "bmod" => "<mi>mod</mi>",
  "mod" => "<mi lspace='1em'>mod</mi>",
  "max" => "<mi>max</mi>",
  "min" => "<mi>min</mi>",
  "Pr" => "<mi>Pr</mi>",
  "sec" => "<mi>sec</mi>",
  "sin" => "<mi>sin</mi>",
  "sinh" => "<mi>sin</mi>",
  "sup" => "<mi>sup</mi>",
  "tan" => "<mi>tan</mi>",
  "tanh" => "<mi>tanh</mi>",
  "," => "<mo>&#x2009;</mo>",
  "thinspace" => "<mo>&#x2009;</mo>",
  "implies" => "<mo>&#x21D2;</mo>",
  "injlim" => "<mo>inj lim</mo>",
  "projlim" => "<mo>proj lim</mo>",
  "nobreakdash" => "<mo>&#x2011;</mo>",
  "lvert" => "<mo form='prefix'>|</mo>",
  "rvert" => "<mo form='postfix'>|</mo>",
  "lVert" => "<mo form='prefix'>&#x2016;</mo>",
  "rVert" => "<mo form='postfix'>&#x2016;</mo>",
}

## Generate a hash table of entities from a shorthand version
## involving a hash table and an array.
##
## _element_:: the HTML element to wrap the entities with
## _opts_:: arguments to the opening HTML element
def generate(element, opts, hash={}, array=[])
  ret = {}

  endt = "</#{element}>"
  startt =
    unless opts.nil? || opts.empty?
      "<#{element} #{opts}>"
    else
      "<#{element}>"
    end

  array.each do |e|
    if Array === e
      e.each { |i| ret[i] = "#{startt}&#{e.last};#{endt}" }
    else
      ret[e] = "#{startt}&#{e};#{endt}"
    end
  end

  hash.each do |e, v|
    if Array === e
      e.each { |i| ret[i] = "#{startt}&#{v};#{endt}" }
    else
      ret[e] = "#{startt}&#{v};#{endt}"
    end
  end
    
  ret
end
module_function :generate

## numbers
NUMS = generate "mn", "", {
  ["infty", "infinity"] => "infin",
}

## greek letters
GREEK = generate "mi", "", {
  "omicron" => "oscr",
  "epsilon" => "epsi",
},
%w(alpha beta gamma delta epsilon varepsilon zeta eta theta vartheta iota kappa lambda mu nu xi pi varpi rho varrho sigma varsigma tau upsilon phi varphi chi psi omega Gamma Delta Theta Lambda Xi Pi Sigma Upsilon Phi Psi Omega)
  
%w(Alpha Beta Zeta Eta Iota Kappa Mu Nu Rho Tau).each do |x|
  GREEK[x] = "<mi>&#{x[0].chr};</mi>"
end

## regular operators ("MOL" in itex2MML parlance)
OPERATORS = generate "mo", "",  {
  "in" => "Element",
  "bottom" => "perp",
  "neg" => "not",
  "mid" => "VerticalBar",
  "|" => "DoubleVerticalBar",
  ["int", "integral"] => "Integral",
  ["iint", "doubleintegral"] => "Int",
  ["iiint", "tripleintegral"] => "tint",
  ["iiiint", "quadtrupleintegral"] => "qint",
    
}, [
  ["Longleftrightarrow", "iff"],
  "Leftrightarrow",
  ["impliedby", "Leftarrow"],
  ["implies", "Rightarrow"],
  "hookleftarrow",
  ["embedsin", "hookrightarrow"],
  "longleftarrow",
  "longrightarrow",
  "leftarrow",
  ["to", "rightarrow"],
  "leftrightarrow",
  ["mapsto", "map"],
  ["nearrow", "nearr"],
  ["nwarrow", "nwarr"],
  ["searrow", "searr"],
  ["swarrow", "swarr"],
  ["neArrow", "neArr"],
  ["nwArrow", "nwArr"],
  ["seArrow", "seArr"],
  ["swArrow", "swArr"],
  ["downarrow", "darr"],
  ["uparrow", "uparr"],
  ["downuparrow", "updownarrow", "duparr", "updarr"],
  ["union", "cup"],
  ["neq", "ne"],
  ["oint", "contourintegral", "conint"],
  "times",
  "otimes",
  "oplus",
  "wedge",
] + %w(lfloor lceil lang langle gt lt subset subseteq prec parallel nparallel perp gg geq ge le leq nsubset nsubseteq notin ni nmid preceq npreceq ll ngeq nleq supset supseteq approx sim triangleleft cong succ nsucc ngtr nsupset nsupseteq propto equiv triangleright ncong succeq nsucceq amalg setminus smallsetminus pm circ ltimes div rtimes Im bot emptyset prime therefore flat vee Re exists hbar because sharp bullet aleph nexists imath not top wp natural square angle forall jmath partial ell bigtriangleup bigtriangledown beth nprec Subset)

## notation ("MO")
NOTATION = generate "mo", "",  {
  "cdot" => "sdot",
  "ddots" => "dtdot",
  "ldots" => "ltdot",
  "vdots" => "vellip",
  "qed" => "squf",
},
%w(rfloor rceil rang rangle)
  
#NOTATION["cdots"] = "<mo>&sdot; &sdot; &sdot;</mo>"
NOTATION["cdots"] = "<mo>&ctdot;</mo>"
NOTATION["pmod"] = "&nbsp; mod"

## unary operators ("MOB")
UNARY_OPERATORS = generate "mo", 'lspace="thinmathspace" rspace="thinmathspace"', {
  "sum" => "Sum",
  ["bigwedge", "Wedge"] => "xwedge",
},
[ 
  ["bigcup", "Union"],
  ["product", "prod"],
  ["coproduct", "coprod"],
  ["bigotimes", "Otimes"],
  ["bigoplus", "Oplus"],
]
#UNARY_OPERATORS["lim"] = "<mo lspace=\"thinmathspace\" rspace=\"thinmathspace\">lim</mo>"

## spaces
SPACES = {
  "," => '<mspace width="thinmathspace"/>',
  "thinspace" => '<mspace width="thinmathspace"/>',
  "medspace" => '<mspace width="mediummathspace"/>',
  " " => '<mspace width="mediummathspace"/>',
  "thickspace" => '<mspace width="thickmathspace"/>',
  "quad" => '<mspace width="verythickmathspace"/>',
  "!" => '<mspace width="-0.1667 em"/>',
  "negspace" => '<mspace width="-0.1667 em"/>',
}

## functions
MATH_FUNCTIONS = {}
%w(arccos arcsin arctan arg cos cosh cot coth csc deg det dim exp gcd hom inf ker lg liminf linmsup ln log bmod mod max min Pr sec sin sinh sup tan tanh).each { |x| MATH_FUNCTIONS[x] = "<mi>#{x}</mi>" }

TOKENS = {
  "-" => "&minus;",
  "&" => "&amp;",
  ">" => "&gt;",
  "<" => "&lt;",
}

ENTITIES = DEFAULTS.merge(NUMS).merge(GREEK).merge(OPERATORS).merge(NOTATION).merge(UNARY_OPERATORS).merge(SPACES).merge(MATH_FUNCTIONS)

end
end
