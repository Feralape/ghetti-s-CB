/*
	Defines for use in saycode and text formatting.
	Currently contains speech spans and message modes
*/



//Spans. Robot speech, italics, etc. Applied in compose_message().
#define SPAN_ROBOT "robot"
#define SPAN_YELL "yell"
#define SPAN_ITALICS "italics"
#define SPAN_SANS "sans"
#define SPAN_PAPYRUS "papyrus"
#define SPAN_REALLYBIG "reallybig"
#define SPAN_COMMAND "command_headset"
#define SPAN_CLOWN "clown"
#define SPAN_SINGING "singing"

//bitflag #defines for return value of the radio() proc.
#define ITALICS 1
#define REDUCE_RANGE 2
#define NOPASS 4

//Eavesdropping
#define EAVESDROP_EXTRA_RANGE 1 //how much past the specified message_range does the message get starred, whispering only

// A link given to ghost alice to follow bob
#define FOLLOW_LINK(alice, bob) "<a href=?src=[REF(alice)];follow=[REF(bob)]>(F)</a>"
#define TURF_LINK(alice, turfy) "<a href=?src=[REF(alice)];x=[turfy.x];y=[turfy.y];z=[turfy.z]>(T)</a>"
#define FOLLOW_OR_TURF_LINK(alice, bob, turfy) "<a href=?src=[REF(alice)];follow=[REF(bob)];x=[turfy.x];y=[turfy.y];z=[turfy.z]>(F)</a>"

#define LINGHIVE_NONE 0
#define LINGHIVE_OUTSIDER 1
#define LINGHIVE_LING 2
#define LINGHIVE_LINK 3

//whether the emote is visible or audible.
#define EMOTE_VISIBLE 1
#define EMOTE_AUDIBLE 2

//Don't set this very much higher then 1024 unless you like inviting people in to dos your server with message spam
#define MAX_MESSAGE_LEN			4096		//Citadel edit: What's the WORST that could happen?
#define MAX_FLAVOR_LEN			4096
#define MIN_FLAVOR_LEN			0
#define MIN_OOC_LEN				0
#define MAX_TASTE_LEN			40
#define MAX_NAME_LEN			42
#define MAX_BROADCAST_LEN		512
#define MAX_CHARTER_LEN			80

// Template for OOC notes.
#define OOC_NOTE_TEMPLATE "Non-ERP Notes\n\
	This exist for things like how to approach this character for IC things such as how to ask for going on adventurers!\n\
	But this person hasn't changed the info yet!\n\
	\n\
	\n\
	ERP Notes\n\
	Put lewd things about yourself here.\n\
	\n\
	...............ERP: Ask\n\
	...............Non-Con: Ask\n\
	...............Partner Prefs: Ask\n\
	.............- Slavery: Ask\n\
	.............- Non-Con: Ask\n\
	.............- Vore: Ask\n\
	\n\
	Big Yes's\n\
	.............- This area\n\
	.............- exists to\n\
	.............- List out\n\
	.............- things you\n\
	.............- like.\n\
	\n\
	Hard No\n\
	.............- This area exists\n\
	.............- For you to list things\n\
	.............- You very specifically\n\
	.............- Do not like."

#define BACKGROUND_INFO_NOTE_TEMPLATE "Background Info Template\n\
	Keep in mind that you do not need to have answers for all of these questions from the word go, but having answers for some of them should greatly improve your playing experience due to it solidifying your character more robustly in a very fluid world.\n\
	\n\
	1. What is your characters background?  What setting are they from?  How did they come here?"


// Is something in the IC chat filter? This is config dependent.
#define CHAT_FILTER_CHECK(T) (config.ic_filter_regex && findtext(T, config.ic_filter_regex))

// Audio/Visual Flags. Used to determine what sense are required to notice a message.
#define MSG_VISUAL (1<<0)
#define MSG_AUDIBLE (1<<1)

//Used in visible_message_flags, audible_message_flags and runechat_flags
#define EMOTE_MESSAGE (1<<0)
// Only show the overhead thing
#define ONLY_OVERHEAD (1<<1)
// Append the player's name to the front
#define PUT_NAME_IN (1<<2)

#define EMOTE_HEADER_TEXT "\
	- underline(_text_), bold(+text+), italic(|text|). \n\
	- singing(%text), your name(@), ! at start to emote on radio. \n\
	- some emoticons can be used with say also."
//Dan is the best, <3 ~TK
//put space before the \ so it reads properly
// use \ for readability, but one big line. \n for a new line. \n\ for a new line and readability.
