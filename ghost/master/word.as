function agoldcoin
{
	return Random.Select([
		"a {metal} coin",
		"a set of {metal} forks",
		"a {metal} necklace",
		"{aruby} ring"
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
		"titanium"
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
		"pewter"
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
		"an amber"
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
		"topaz"
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
		"brooch"
	]);
}

function fork
{
	return Random.Select([
		"fork",
		"key",
		"hinge",
		"thingy" //I mean.............
	]);
}

function whileyouwereaway
{
	return Random.Select([
		"while you were away on your trip",
		"up near the beach",
		"by the coral reef",
		"in one of those caves by the big rock"
	]);
}

function anewshipwreck
{
	return Random.Select([
		"a new shipwreck",
		"something good at the market today",
		"some pretty shells over by the reef"
	]);
}

function bythebay
{
	return Random.Select([
		"by the bay",
		"behind the market",
		"in an old chest",
		"under an old shipwreck"
	]);
}

function bigrockoverthere
{
	return Random.Select([
		"big rock over there",
		"bay",
		"reef",
		"market"
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
		"a ray"
	]);
}

function thekelpforest
{
	return Random.Select([
		"the edges of the kelp forest",
		"those big rocks by the cliff",
		"one of the small tunnels that leads into the back of our cave",
		"the reef",
		"that spot with all the good pebbles"
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
		"squid"
	]);
}