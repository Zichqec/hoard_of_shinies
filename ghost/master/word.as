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
		"platinum"
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