function OnSpectrePlugin@ConfirmCalibration
{
	return "\![raiseplugin,Spectre,OnCustomCalibrationConfirm,--option=include,normal,embarrassed,smile,surprised,discouraged]";
}

function OnSpectrePlugin@Surface
{
	if (Shiori.Reference[0] == "normal") { return "\s[0]"; }
	else if (Shiori.Reference[0] == "embarrassed") { return "\s[1]"; }
	else if (Shiori.Reference[0] == "smile") { return "\s[2]"; }
	else if (Shiori.Reference[0] == "surprised") { return "\s[5]"; }
	else if (Shiori.Reference[0] == "discouraged") { return "\s[6]"; } //It's a bit of a stretch, but... I think it really helps for the dissociated pool
}

function OnSpectrePlugin@Possession
{
	if (Random.GetIndex(0,4) == 0)
	{
		if (Shiori.Reference[1] == 1)
		{
			return Reflection.Get("SpectreTalk_spooky");
		}
		else
		{
			return Reflection.Get("SpectreTalk_{Shiori.Reference[0]}");
		}
	}
}

//—————————— Spectre responses ——————————
talk SpectreTalk_cheerful
{
	\s[2]Hmm-hmm~ Hmm-hmm~
}

talk SpectreTalk_cheerful
{
	\s[2]I'm having so much fun today~!
}

talk SpectreTalk_cheerful
{
	\s[2]Ahh, everything's sparkling perfectly right now, isn't it~?
}

talk SpectreTalk_cheerful
{
	\s[3]Hehe~ I feel so bubbly today~
}

talk SpectreTalk_cheerful
{
	\s[0]We should definitely go treasure hunting later.
	
	\s[5]I just know that we'd find something good, \w8\s[2]I can feel it~!
}


talk SpectreTalk_miserable
{
	\s[0]Um... \s[1]is the water a little colder today?
	
	Maybe I should go for a swim...
}

talk SpectreTalk_miserable
{
	\s[0]Hm... \w8\w8\s[1]Something feels a bit off. Maybe I should clean up a little...
}

talk SpectreTalk_miserable
{
	\s[1]Hm... I feel kinda strange. \s[6]Like there's an energy in me that needs to get out.
	
	\s[1]I wonder if swimming around for a while would help.
}

talk SpectreTalk_miserable
{
	\s[6]Is it a little darker in here than usual...?
	
	\s[1]Maybe I'm just imagining things.
}

talk SpectreTalk_miserable
{
	\s[6]Hmm... No, no no no...
}


talk SpectreTalk_dissociated
{
	\s[1]I don't like the way the kelp is swaying today. It feels... ominous.
}

talk SpectreTalk_dissociated
{
	\s[1]I have an odd feeling like something bad is going to happen...
	
	\s[1]\i[450]It's probably nothing, right...? \s[1]Right.
}

talk SpectreTalk_dissociated
{
	\s[0]Something's wrong.
	
	... \s[6]I'm not sure what.
}

talk SpectreTalk_dissociated
{
	\s[0]Hmm... \s[6]I have this sense of unease, like there's a predator nearby.
	
	\s[1]\i[450]But I don't see anything. \s[1]Do you...?
}

talk SpectreTalk_dissociated
{
	\s[6]Um, I wonder if maybe we shouldn't stay here too long today...
	
	\s[1]I just feel like something terrible might happen.
}


talk SpectreTalk_spooky
{
	\s[1]Did you hear someone outside just now...?
	
	Maybe not... It must be my imagination.
}

talk SpectreTalk_spooky
{
	\s[6]I feel like the cave suddenly got a lot smaller...
	
	\s[1]\i[450]Did you notice it too...? \w8\s[6]It might just be me...
}

talk SpectreTalk_spooky
{
	\s[6]Did something fall over? I heard something terrible...
}

talk SpectreTalk_spooky
{
	\s[6]Do you think... do you think a sea monster got in here...?
	
	\s[1]\i[450]I know, I know, sea monsters aren't real, but... \s[1]I swear I heard \f[italic,1]something\f[italic,default]...
}

talk SpectreTalk_spooky
{
	\s[6]Did you hear a growling noise...?
}


//—————————— Needle poking ——————————
function OnNeedlePoke
{
	if (Shiori.Reference[0] == 0)
	{
		return NeedleTalk;
	}
	
}

talk NeedleTalk
{
	\s[5]Oh... \s[4]Is this for me?
	
	\s[2]Ohhh thank you thank you, so sparkly~!!
}

talk NeedleTalk
{
	\s[5]Oooh, what's this, what's this?
	
	\s[2]Something new, something new~!
}

talk NeedleTalk
{
	\s[5]Ohh... \s[2]Oh wow, where did you find this? \s[5]It's so shiny...
	
	\s[0]Where should we put it...?
}

talk NeedleTalk
{
	\s[5]Oh wow... This is a gift for me...?
	
	\s[2]Ohh thank you thank you {username}! \s[3]I'll keep it safe~!
}

talk NeedleTalk
{
	\s[5]Ohhh... that's so cool, what is it...?
	
	\s[2]Hehe, I don't know what it is, but it's shiny so it belongs in our collection~!
}


//—————————— zzzzzzzzz sleeping ——————————
talk OnPhantaEepy
{
	\s[0]I feel a little... \![set,balloonwait,1.7]sleepy...
	
	\![set,balloonwait,2.5]\s[9]Z z z...
}

talk OnPhantaEepy
{
	\s[9]\![set,balloonwait,2.5]... Z z z...
}

talk OnPhantaEepy
{
	\s[1]Oh... \![set,balloonwait,1.7]I suddenly feel a nap coming on...
	
	\![set,balloonwait,2.5]\s[9]Z z z...
}


//—————————— LOBO howling ——————————
talk OnLoboHowl
{
	\s[5]Oh... \s[2]I hear whalesong, today must be a lucky day~!
}

talk OnLoboHowl
{
	\s[5]Oooh... \s[4]{username}, {username}, can you hear that? \s[3]There must be a whale somewhere nearby~!
}

talk OnLoboHowl
{
	\s[5]Ohh, do you hear that? \s[3]I love listening to the whales sing...
}