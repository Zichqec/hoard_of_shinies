function agoldcoin
{
	return Random.Select([
		"a {metal} coin",
		"a set of {metal} forks",
		"a {metal} necklace",
		"{aruby} ring",
		"a {metal} jewelery box",
		"a {metal} bracelet",
		"a {metal} charm",
	]);
}

function metal
{
	return Random.Select([
		"gold",
		"silver",
		"copper",
		"bronze",
		"platinum",
		"titanium",
	]);
}

function plainmetal
{
	return Random.Select([
		"iron",
		"stainless steel",
		"copper",
		"brass",
		"nickel",
		"pewter",
	]);
}

function aruby
{
	return Random.Select([
		"a ruby",
		"an emerald",
		"a sapphire",
		"an opal",
		"an amethyst",
		"a topaz",
		"an amber",
		"a diamond",
	]);
}

function rubies
{
	return Random.Select([
		"rubies",
		"sapphires",
		"garnets",
		"emeralds",
		"amethysts",
		"topaz",
		"diamonds",
	]);
}

//Not using this atm since I decided to change that dialogue, but for future reference...
// function gemsgem
// {
	// return Random.Select([
	// {singular: "ruby", plural: "rubies"},
	// {singular: "sapphire", plural: "sapphires"},
	// {singular: "topaz", plural: "topaz"}
	// ]);
// }

function necklace
{
	return Random.Select([
		"necklace",
		"ring",
		"bracelet",
		"brooch",
		"circlet",
		"earring",
		"anklet",
		"choker",
	]);
}

function fork
{
	return Random.Select([
		"fork",
		"key",
		"hinge",
		"thingy", //I mean.............
		"spoon",
		"butter knife",
		"teapot",
		"cup",
		"clasp",
		"scrap",
	]);
}

function whileyouwereaway
{
	return Random.Select([
		"while you were away on your trip",
		"up near the beach",
		"by the coral reef",
		"in one of those caves by the big rock",
		"while you were at the market",
		"while you were sleeping",
		"last night when I was too excited to sleep",
	]);
}

function anewshipwreck
{
	return Random.Select([
		"a new shipwreck",
		"something good at the market today",
		"some pretty shells over by the reef",
		"something interesting on the other side of the kelp forest",
		"some treasure in one of those caves we haven't explored yet",
		"something good up near the shore",
	]);
}

function bythebay
{
	return Random.Select([
		"by the bay",
		"behind the market",
		"in an old chest",
		"under an old shipwreck",
		"near the shore",
		"at the top of the cliffs",
		"under a torn up old flag",
	]);
}

function bigrockoverthere
{
	return Random.Select([
		"big rock over there",
		"bay",
		"reef",
		"market",
		"edge of the kelp forest",
		"nearest sunken ship",
		"sandy clearing",
	]);
}

function ashark
{
	return Random.Select([
		"a shark",
		"a school of fish",
		"a lobster",
		"a crab",
		"a whale",
		"another merfolk",
		"a ray",
		"a seahorse",
		"a turtle",
		"an octopus",
		"a squid",
		"a manatee",
		"a seal",
	]);
}

function thekelpforest
{
	return Random.Select([
		"the edges of the kelp forest",
		"those big rocks by the cliffs",
		"one of the small tunnels that leads into the back of our cave",
		"the reef",
		"that spot with all the good pebbles",
		"that sandy clearing",
		"the rocky area just before you reach the bay",
		"one of the sunken ships we explored a while back",
	]);
}

function crab
{
	return Random.Select([
		"crab",
		"ray",
		"eel",
		"lobster",
		"octopus",
		"squid",
		"clam",
		"turtle",
		"seahorse",
	]);
}

function afish
{
	return Random.Select([
		"a fish",
		"a crab",
		"a squid",
		"a lobster",
		"an octopus",
		"an eel",
		"a ray",
		"a shark",
		"a whale",
		"a scallop shell",
		"a conch shell",
		"a kelp leaf",
		"a rock",
		"a seasnail",
		"a seahorse",
		"a turtle",
	]);
}

//It's like thekelpforest but the grammar is a bit different...
function thecliffs
{
	return Random.Select([
		"the cliffs",
		"those big rocks on the other side of the kelp forest",
		"the outskirts of town",
		"the reef",
		"that old shipwreck, the one that was full of crabs when we first explored it",
		"the bay",
		"that sandy clearing",
		"those caves",
	]);
}

function metalgem
{
	return Random.Select([
		"precious metal",
		"gemstone",
		"shell",
		"coral",
		"fish",
		"accessory",
		"jewelery",
		"{necklace}",
	]);
}

function IslandBubbling
{
	local output = Random.Select([
		"Bubble",
		"Bloop",
		"Blop",
		"Blub",
		"Burble",
		"Blup",
		"Blub-blub-blub",
		"Bloop-bloop-bloop",
	]);
	return "\1\f[italic,1]{output}\f[italic,default]";
}

function forks
{
	return Random.Select([
		"forks",
		"necklaces",
		"scraps",
		"rings",
		"clasps",
		"brooches",
		"teapots",
		"spoons",
		"butter knives",
		"keys",
		"cups",
	]);
}