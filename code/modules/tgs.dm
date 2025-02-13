// tgstation-server DMAPI
// The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in IETF RFC 2119.

#define TGS_DMAPI_VERSION "7.3.1"

// All functions and datums outside this document are subject to change with any version and should not be relied on.

// CONFIGURATION

/// Consumers SHOULD create this define if you want to do TGS configuration outside of this file.
#ifndef TGS_EXTERNAL_CONFIGURATION

// Consumers MUST comment this out once you've filled in the below and are not using [TGS_EXTERNAL_CONFIGURATION].
#error TGS API unconfigured

// Consumers MUST uncomment this if you wish to allow the game to interact with TGS version 3.
// This will raise the minimum required security level of your game to TGS_SECURITY_TRUSTED due to it utilizing call()().
//#define TGS_V3_API

// Required interfaces (fill in with your codebase equivalent):

/// Create a global variable named `Name` and set it to `Value`.
#define TGS_DEFINE_AND_SET_GLOBAL(Name, Value)

/// Read the value in the global variable `Name`.
#define TGS_READ_GLOBAL(Name)

/// Set the value in the global variable `Name` to `Value`.
#define TGS_WRITE_GLOBAL(Name, Value)

/// Disallow ANYONE from reflecting a given `path`, security measure to prevent in-game use of DD -> TGS capabilities.
#define TGS_PROTECT_DATUM(Path)

/// Display an announcement `message` from the server to all players.
#define TGS_WORLD_ANNOUNCE(message)

/// Notify current in-game administrators of a string `event`.
#define TGS_NOTIFY_ADMINS(event)

/// Write an info `message` to a server log.
#define TGS_INFO_LOG(message)

/// Write an warning `message` to a server log.
#define TGS_WARNING_LOG(message)

/// Write an error `message` to a server log.
#define TGS_ERROR_LOG(message)

/// Get the number of connected /clients.
#define TGS_CLIENT_COUNT

#endif

#ifndef TGS_FILE2TEXT_NATIVE
#ifdef file2text
#error Your codebase is re-defining the BYOND proc file2text. The DMAPI requires the native version to read the result of world.Export(). You SHOULD fix this by adding "#define TGS_FILE2TEXT_NATIVE file2text" before your override of file2text to allow the DMAPI to use the native version. This will only be used for world.Export(), not regular file accesses
#endif
#define TGS_FILE2TEXT_NATIVE file2text
#endif

// SpacemanDMM compatibility
#ifndef CAN_BE_REDEFINED
#define CAN_BE_REDEFINED(X)
#endif

// EVENT CODES

//REQUIRED HOOKS

/**
 * Consumers MUST call this somewhere in [/world/proc/New] that is always run. This function may sleep!
 *
 * * event_handler - Optional user defined [/datum/tgs_event_handler].
 * * minimum_required_security_level: The minimum required security level to run the game in which the DMAPI is integrated. Can be one of [TGS_SECURITY_ULTRASAFE], [TGS_SECURITY_SAFE], or [TGS_SECURITY_TRUSTED].
 * * http_handler - Optional user defined [/datum/tgs_http_handler].
 */
/**
 * Consumers MUST call this when world initializations are complete and the game is ready to play before any player interactions happen.
 *
 * This may use [/world/var/sleep_offline] to make this happen so ensure no changes are made to it while this call is running.
 * Afterwards, consider explicitly setting it to what you want to avoid this BYOND bug: http://www.byond.com/forum/post/2575184
 * This function should not be called before ..() in [/world/proc/New].
 */

// DATUM DEFINITIONS
// All datums defined here should be considered read-only

/// Represents git revision information.

/// Represents a version.

/**
 * Returns [TRUE]/[FALSE] based on if the [/datum/tgs_version] contains wildcards.
 */

/**
 * Returns [TRUE]/[FALSE] based on if the [/datum/tgs_version] equals some other version.
 *
 * other_version - The [/datum/tgs_version] to compare against.
 */


/// Represents a merge of a GitHub pull request.

/// Represents a connected chat channel.

/// User definable handler for HTTP calls. This abstract version MUST be overridden to be used.
/datum/tgs_http_handler

/**
 * User definable callback for executing HTTP GET requests.
 * MUST perform BYOND sleeps while the request is in flight.
 * MUST return a [/datum/tgs_http_result].
 * SHOULD log its own errors
 *
 * url - The full URL to execute the GET request for including query parameters.
 */
/datum/tgs_http_handler/proc/PerformGet(url)
	CRASH("[type]/PerformGet not implemented!")

/// Result of a [/datum/tgs_http_handler] call. MUST NOT be overridden.
/datum/tgs_http_result
	/// HTTP response as text
	var/response_text
	/// Boolean request success flag. Set for any 2XX response code.
	var/success

/**
 * Create a [/datum/tgs_http_result].
 *
 * * response_text - HTTP response as text. Must be provided in New().
 * * success - Boolean request success flag. Set for any 2XX response code. Must be provided in New().
 */
/datum/tgs_http_result/New(response_text, success)
	if(response_text && !istext(response_text))
		CRASH("response_text was not text!")

	src.response_text = response_text
	src.success = success

/// User definable chat command. This abstract version MUST be overridden to be used.

/**
 * Process command activation. Should return a [/datum/tgs_message_content] to respond to the issuer with.
 * MUST be implemented
 *
 * * sender - The [/datum/tgs_chat_user] who issued the command.
 * * params - The trimmed string following the command `/datum/tgs_chat_command/var/name].
 */

/// User definable chat message. MUST NOT be overridden.

/**
 * Create a [/datum/tgs_message_content].
 *
 * * text - The string content of the message.
 */
/datum/tgs_message_content/New(text)
	..()
	if(!istext(text))
		TGS_ERROR_LOG("[/datum/tgs_message_content] created with no text!")
		text = null

	src.text = text

/// User definable chat embed. Currently mirrors Discord chat embeds. See https://discord.com/developers/docs/resources/message#embed-object for details.


/// Common datum for similar Discord embed medias.
/datum/tgs_chat_embed/media
	/// Must be set in New().


/// Create a [/datum/tgs_chat_embed].
/datum/tgs_chat_embed/media/New(url)
	..()
	if(!istext(url))
		CRASH("[/datum/tgs_chat_embed/media] created with no url!")

	src.url = url

/// See https://discord.com/developers/docs/resources/message#embed-object-embed-footer-structure for details.
/datum/tgs_chat_embed/footer
	/// Must be set in New().

/// Create a [/datum/tgs_chat_embed/footer].
/datum/tgs_chat_embed/footer/New(text)
	..()
	if(!istext(text))
		CRASH("[/datum/tgs_chat_embed/footer] created with no text!")

	src.text = text

/// Create a [/datum/tgs_chat_embed/footer].
/datum/tgs_chat_embed/provider/author/New(name)
	..()
	if(!istext(name))
		CRASH("[/datum/tgs_chat_embed/provider/author] created with no name!")

	src.name = name

/// See https://discord.com/developers/docs/resources/message#embed-object-embed-field-structure for details.

/// Create a [/datum/tgs_chat_embed/field].
/datum/tgs_chat_embed/field/New(name, value)
	..()
	if(!istext(name))
		CRASH("[/datum/tgs_chat_embed/field] created with no name!")

	if(!istext(value))
		CRASH("[/datum/tgs_chat_embed/field] created with no value!")

	src.name = name
	src.value = value

// API FUNCTIONS

/**
 * Trigger an event in TGS. Requires TGS version >= 6.3.0. Returns [TRUE] if the event was triggered successfully, [FALSE] otherwise. This function may sleep!
 *
 * event_name - The name of the event to trigger
 * parameters - Optional list of string parameters to pass as arguments to the event script. The first parameter passed to a script will always be the running game's directory followed by these parameters.
 * wait_for_completion - If set, this function will not return until the event has run to completion.
 */


/*
The MIT License

Copyright (c) 2017-2024 Jordan Brown

Permission is hereby granted, free of charge,
to any person obtaining a copy of this software and
associated documentation files (the "Software"), to
deal in the Software without restriction, including
without limitation the rights to use, copy, modify,
merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom
the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice
shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR
ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
