talk OnFirstBoot
{
	%{
		local dressups = RandomizeDressups();
	}
	\1\s[10]\![set,alignmenttodesktop,bottom]\0{dressups}\s[9]\b[0]Hmm-hmm... Hmm-hmm...\w8\w8\w8\w8
	
	\s[0]\i[450]Oh! \s[4]{username}, you made it! \s[2]Come on come on come on, come look and see the new cave!\x\n[-200]
	
	\s[0]Hehe... hehehe... \w8\w8\s[3]It's great, isn't it? \s[0]There's so much space for all our shinies!
	
	\s[1]I um, I got kind of excited and moved everything over already... Sorry for not giving you more of a heads up.\x\n[-200]
	
	\s[2]But! Look at it! There's SO MUCH room here!! \s[0]I can't wait to find all sorts of new treasures and fill up these little alcoves.
	
	\s[0]\i[450]But you'll wanna have a look around first to get used to it, right? \s[4]Right! \s[0]Let's hang out here for a while then, I can wait.
}

//—————————————————————————————— Booting ——————————————————————————————
talk BootTalk
{
	\s[2]Hey hey hey, come in, come in! \s[0]\i[450]What did you bring?
	
	\s[3]Ooh, {agoldcoin}! \s[4]That's so cool! \s[0]Where should we put it?\w8\w8
	
	\s[2]Hehe, maybe I'll let you decide~
}

talk BootTalk
{
	\s[9]Z\w8 z\w8 z\w8.\w8.\w8.
	
	\s[0]\i[450]Hmm? \w8\s[4]Oh, {username}! \s[1]Ahh, sorry, I meant to clean up in here but then I just got SO sleepy...
	
	\s[0]But nevermind that, come check out what I found earlier! \s[3]{agoldcoin}! Isn't it great?
}

talk BootTalk
{
	\s[2]{username} {username} {username} {username} {username}!!
	
	\s[0]Come on come on, I rearranged all the stuff we brought in last week, \w8\s[4]look at how nice it is now!!
}

talk BootTalk
{
	\s[2]Hehehehe, you're here, you're here~! \s[5]Whatcha got whatcha got?
	
	\s[3]Ohhhh SO MANY shinies today! \s[2]What a haul~!!
}

talk BootTalk
{
	\s[0]\i[451]{username}! You're finally here! I've been waiting to show you all the stuff I found {whileyouwereaway}!
	
	\s[2]So many sparklies~ Come check them out~!
}


//—————————————————————————————— Closing ——————————————————————————————
talk CloseTalk
{
	\s[0]Yes yes, I wanna head out and start exploring. \s[2]I heard there might be {anewshipwreck} and I GOTTA check it out. \s[4]Let's go together~!
}

talk CloseTalk
{
	\s[5]Oh! \s[0]Are you heading out? \s[2]I'll come with you! \s[3]Let's explore, let's explore~!
}

talk CloseTalk
{
	\s[0]Oh, if you're heading out I think I'll stay behind and organize a little... \s[1]I've let it get a bit messy in here, hehe...
	
	\s[2]Come back with something good soon~!
}

talk CloseTalk
{
	\s[4]I think I'm gonna head out for now. \s[2]I gotta get MOVING, there's so much to find out there~!
	
	\s[0]\i[450]I'll make sure I bring something back for you, hehe~
}

talk CloseTalk
{
	\s[0]Hmm... \s[4]I think I'm gonna head out now. \s[2]I'm itching to get out and find something new.
	
	\s[5]Wanna come with me? \s[3]I'm sure it'll be fun~!
}

talk CloseTalk
{
	\0\s[2]Race you to the {bigrockoverthere}~!
}