--= Alan StdLib Fork: Verbs Module
--| Tristano Ajmone <tajmone@gmail.com>
--~-----------------------------------------------------------------------------
--~ "lib_verbs.i"
--| 2019-06-17: Alan 3.0beta6 build 1980
--|=============================================================================
--| Adaptation of the `lib_verbs.i` module, taken from
--| _ALAN Standard Library_ v2.1, (C) Anssi R�is�nen, Artistic License 2.0.
--| Edited by Tristano Ajmone,  (C) 2019, Artistic License 2.0.
--|=============================================================================

-- ALAN Standard Library v2.1
-- Verbs (file name: 'lib_verbs.i')



----- This library file defines common verbs needed in gameplay. The verbs
----- are listed alphabetically. This file also includes common commands which are not
----- actually verbs, such as "inventory", "verbose" and "again".
----- Verbs originally defined in this file are the following:

----- Directions (north, south, up, etc.) are declared in the file 'locations.i'.


-->verbs_list(1000)
--~=============================================================================
--~* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--~ * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--~-----------------------------------------------------------------------------
--|
--| == List of All Verbs
--|
--~-----------------------------------------------------------------------------
--~* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--~ * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--~=============================================================================
--|
--| Below are listed all the verbs defined by the library, divided into three
--| groups:
--| 
--| 1. <<Meta Verbs>>
--| 2. <<Game Commands>>
--| 3. <<Questions and Answers Verbs>>
--| 
--| The verbs in each table are sorted alphabetically, to simplify consultation.
--| In the actual source code, verbs definitions are grouped by affinity, in
--| order to simplify editing or studying on them.
--| 
--| ============================================================================
--| 
--| [big]#*Tables Notation*#
--| 
--| The meaning of the letters in the last two columns is the following:
--| 
--| [horizontal]
--|   [A] Arity     :: <n> = number of parameters
--|   [M] Meta Verb :: {X} = Yes
--| ============================================================================
--<

-->meta_verbs(10000)
--~=============================================================================
--~* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--~ * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--~-----------------------------------------------------------------------------
--|
--| == Meta Verbs
--|
--~-----------------------------------------------------------------------------
--~* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--~ * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--~=============================================================================
--|
--| This group includes verbs dealing with gameplay aspects (saving, leaving,
--| etc.) instead of the adventure world or the main character. They are all
--| `META` verbs, which don't consume a turn in the adventure game.
--| Also known as _extradiegetic commands_, or _out-of-world actions_.
--<

-->table_meta_verbs(1010)
--| === Table of Meta Verbs
--| [cols="15m,25d,35d,2*^5d",options="header"]
--| |=========================================================================
--| | VERB       | SYNONYMS                           | SYNTAX     | A |  M 
--~ +------------+------------------------------------+------------+---+-----+
--| | about      | help, info                         | about      | 0 | {x}
--| | brief      |                                    | brief      | 0 | {x}
--| | credits    | acknowledgments, author, copyright | credits    | 0 | {x}
--| | hint       | hints                              | hint       | 0 | {x}
--| | notify     |                                    | notify     | 0 | {x}
--| | notify_on  |                                    | notify on  | 0 | {x}
--| | notify_off |                                    | notify off | 0 | {x}
--| | quit       | Q                                  | quit       | 0 | {x}
--| | script     |                                    | script     | 0 | {x}
--| | script_on  |                                    | script on  | 0 | {x}
--| | script_off |                                    | script off | 0 | {x}
--| | restart    |                                    | restart    | 0 | {x}
--| | restore    |                                    | restore    | 0 | {x}
--| | save       |                                    | save       | 0 | {x}
--| | verbose    |                                    | verbose    | 0 | {x}
--| |=========================================================================
--<


-- =============================================================


----- ABOUT


-- =============================================================


SYNTAX 'about' = 'about'.

SYNONYMS help, info = 'about'.


META VERB 'about'
  CHECK my_game CAN about
    ELSE SAY restricted_response OF my_game.
  DOES
    "[This is a text adventure, also called interactive fiction, which means that what
    goes on in the story depends on what you type at the prompt. Commands you can type
    are for example GO NORTH (or NORTH or just N), WEST, SOUTHEAST, UP, IN etc for
    moving around, but you can try many
        other things too, like TAKE LAMP, DROP EVERYTHING, EAT APPLE, EXAMINE BIRD or
    FOLLOW OLD MAN, to name just a few. LOOK (L) describes your surroundings, and
    INVENTORY (I) lists what you are carrying. You can SAVE your game and RESTORE it
    later on.
    $pType CREDITS to see information about the author and the copyright issues.
    $pTo stop playing and end the program, type QUIT.]$p"
END VERB 'about'.


-- ================================================================


----- BRIEF


-- ================================================================


-- Use "Visits 0." or "Visits 1000." in the START section if you want
-- the game to start in verbose or brief mode. (By default,
-- all games start in the verbose mode.)


SYNTAX brief = brief.


META VERB brief
  CHECK my_game CAN brief
    ELSE SAY restricted_response OF my_game.
  DOES
    Visits 1000.
    "Brief mode is now on. Location descriptions will only be shown
    the first time you visit."
END VERB brief.


-- ==============================================================


----- CREDITS (+ acknowledgments, author, copyright)


-- ==============================================================


SYNTAX credits = credits.

SYNONYMS acknowledgments, author, copyright = credits.


META VERB credits
  CHECK my_game CAN credits
    ELSE SAY restricted_response OF my_game.
  DOES
    "The author retains the copyright to this game.
    $pThis game was written using the ALAN Adventure Language. ALAN is
    an interactive fiction authoring system by Thomas Nilsson.
    $nE-mail address: thomas@alanif.se $pFurther information
    about the ALAN system can be obtained from
    the World Wide Web Internet site
    $ihttp://www.alanif.se$p"
END VERB credits.


-- ==============================================================


----- HINT (+ hints)


-- ==============================================================


SYNTAX hint = hint.

SYNONYMS hints = hint.

META VERB hint
  CHECK my_game CAN hint
    ELSE SAY restricted_response OF my_game.

  DOES
    "Unfortunately hints are not available in this game."
END VERB hint.



-- ==============================================================


----- NOTIFY


-- ==============================================================


-- Thanks to Steve Griffiths whose 'Score notification' sample was used
-- in declaring this verb.



SYNTAX notify = notify.

   notify_on = notify 'on'.
    -- The instructions tell the player that mere 'notify'
    -- is enough, but these two verbs are implemented
   notify_off = notify 'off'.
    -- In case (s)he adds the prepositions to the end anyway.


META VERB notify
  CHECK my_game CAN notify
    ELSE SAY restricted_response OF my_game.
  DOES
    IF my_game HAS notify_turned_on
      THEN MAKE my_game NOT notify_turned_on.
        "Score notification is now disabled. (You can turn it back on
        using the NOTIFY command again.)"
      ELSE MAKE my_game notify_turned_on. "Score notification is now enabled.
        (You can turn it off using the NOTIFY command again.)"
    END IF.
END VERB notify.


META VERB notify_on
  CHECK my_game CAN notify_on
    ELSE SAY restricted_response OF my_game.
  DOES
    IF my_game HAS notify_turned_on
      THEN "Score notification is already enabled."
      ELSE MAKE my_game notify_turned_on.
        "Score notification is now enabled.
        (You can turn it off using the NOTIFY command again.)"
    END IF.
END VERB notify_on.


META VERB notify_off
  CHECK my_game CAN notify_off
    ELSE SAY restricted_response OF my_game.
  DOES
    IF my_game HAS notify_turned_on
      THEN MAKE my_game NOT notify_turned_on.
        "Score notification is now disabled. (You can turn it back on
        using the NOTIFY command again.)"
      ELSE "Score notification is already disabled."
    END IF.
END VERB notify_off.


-- The 'notify' verb allows the players to disable the score change
-- messages. (Some players find such messages annoying.)
-- The verb toggles the hero's 'notify_on' attribute on and off. That
-- attribute is checked by the 'checkscore' event to determine whether
-- to display the score msg or not.

-- The following event is run each turn to check if the game score is greater than
-- the last recorded score (which is stored in the Hero's 'oldscore'
-- attribute). If the score is greater, then the 'Score has gone up...'
-- text is displayed (as long as the player hasn't disabled it by using the
-- 'notify' verb - which sets 'notify_on' to off
-- - i.e. the hero 'IS NOT notify_on'.)

-- NOTE: The ALAN scoring system records the game score in a thing called
-- score. It isn't called score OF anything; its just 'score'.

-- NOTE: This event assumes score can only increase, if score can go
-- down then you would need to modify this code a bit.


EVENT check_score
  IF oldscore OF my_game < score
    THEN
      IF my_game HAS notify_turned_on
        THEN
          -- ie: the player wants to see score msgs
          "$p(Your score has just gone up by" SAY (score - oldscore OF my_game).
          IF (score - oldscore OF my_game) = 1
            THEN "point.)"
            ELSE "points.)"
          END IF.
          -- this msg only displayed the first time player is notified
          -- of a score change
          IF my_game HAS NOT seen_notify
            THEN MAKE my_game seen_notify.
              "$p(You can use the NOTIFY command to disable score change messages.)"
          END IF.
      END IF.

      SET oldscore OF my_game TO score.
  END IF.
  -- run the 'check_score' event again next turn:
  SCHEDULE check_score AT hero AFTER 1.
END EVENT.


-- ==============================================================


----- QUIT


-- ==============================================================


SYNTAX
  'quit' = 'quit'.

SYNONYMS q = 'quit'.


META VERB 'quit'
  CHECK my_game CAN 'quit'
    ELSE SAY restricted_response OF my_game.
  DOES
    QUIT.
END VERB 'quit'.




-- ==============================================================


------ SCRIPT


-- ==============================================================


SYNTAX 'script' = 'script'.
       script_on = 'script' 'on'.
       script_off = 'script' 'off'.

SYNONYMS 'transcript' = 'script'.

META VERB 'script'
  CHECK my_game CAN 'script'
    ELSE SAY restricted_response OF my_game.
  DOES
    "You can turn transcripting on and off using the 'script on/off' command within the game.
    The transcript will be available in a file with a name starting with the game name.
    $pIn a GUI version you can also find this in the drop-down menu in the interpreter.
    $pIn a command line version you can start your game with the '-s' switch to get a transcript
    of the whole game."
END VERB 'script'.

META VERB script_on
  CHECK my_game CAN script_on
    ELSE SAY restricted_response OF my_game.
  DOES
    TRANSCRIPT ON.
    "Transcripting turned on."
END VERB script_on.

META VERB script_off
  CHECK my_game CAN script_off
    ELSE SAY restricted_response OF my_game.
  DOES
    TRANSCRIPT OFF.
    "Transcripting turned off."
END VERB script_off.



-- ==============================================================


----- RESTART


-- ==============================================================


SYNTAX 'restart' = 'restart'.


META VERB 'restart'
  CHECK my_game CAN 'restart'
    ELSE SAY restricted_response OF my_game.
  DOES
    RESTART.
END VERB 'restart'.



-- ==============================================================


----- RESTORE


-- ==============================================================


SYNTAX 'restore' = 'restore'.


META VERB 'restore'
  CHECK my_game CAN 'restore'
    ELSE SAY restricted_response OF my_game.
  DOES
    RESTORE.
END VERB 'restore'.



-- ==============================================================


----- SAVE


-- ==============================================================


SYNTAX 'save' = 'save'.


META VERB 'save'
  CHECK my_game CAN 'save'
    ELSE SAY restricted_response OF my_game.
  DOES
    SAVE.
END VERB 'save'.



-- ==============================================================


----- VERBOSE (see also -> BRIEF)


-- ==============================================================


SYNTAX verbose = verbose.


META VERB verbose
  CHECK my_game CAN verbose
    ELSE SAY restricted_response OF my_game.
  DOES
    VISITS 0.
    "Verbose mode is now on. Location descriptions will be
    always shown in full."
END VERB verbose.



-->game_commands(20000)
--~=============================================================================
--~* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--~ * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--~-----------------------------------------------------------------------------
--|
--| == Game Commands
--|
--~-----------------------------------------------------------------------------
--~* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--~ * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--~=============================================================================
--| 
--| This group of verbs defines commands directed to the main character in order
--| to interact with the adventure.
--<


-->table_game_verbs(1020)
--| === Table of Game Commands
--| [cols="15m,25d,35d,2*^5d",options="header"]
--| |===============================================================================================
--| | VERB          | SYNONYMS                       | SYNTAX                            | A |  M 
--~ +--------------------+---------------------------+-----------------------------------+---+-----+
--| | again         | G                              | again                             | 0 |
--| | answer        | reply                          | answer (topic)                    | 1 |
--| | ask           | enquire, inquire, interrogate  | ask (act) about (topic)           | 2 |
--| | ask_for       |                                | ask (act) for (obj)               | 2 |
--| | attack        | beat, fight, hit, punch        | attack (target)                   | 1 |
--| | attack_with   |                                | attack (target) with (weapon)     | 2 |
--| | bite          | chew                           | bite (obj)                        | 1 |
--| | break         | destroy                        | break (obj)                       | 1 |
--| | break_with    |                                | break (obj) with (instr)          | 2 |
--| | burn          |                                | burn (obj)                        | 1 |
--| | burn_with     |                                | burn (obj) with (instr)           | 2 |
--| | buy           | purchase                       | buy (item)                        | 1 |
--| | catch         |                                | catch (obj)                       | 1 |
--| | clean         | polish, wipe                   | clean (obj)                       | 1 |
--| | climb         |                                | climb (obj)                       | 1 |
--| | climb_on      |                                | climb on (surface)                | 1 |
--| | climb_through |                                | climb through (obj)               | 1 |
--| | close         | shut                           | close (obj)                       | 1 |
--| | close_with    |                                | close (obj) with (instr)          | 2 |
--| | consult       |                                | consult (source) about (topic)    | 2 |
--| | cut           |                                | cut (obj)                         | 1 |
--| | cut_with      |                                | cut (obj) with (instr)            | 2 |
--| | dance         |                                | dance                             | 0 |
--| | dig           |                                | dig (obj)                         | 1 |
--| | dive          |                                | dive                              | 0 |
--| | dive_in       |                                | dive in (liq)                     | 1 |
--| | drink         |                                | drink (liq)                       | 1 |
--| | drive         |                                | drive (vehicle)                   | 1 |
--| | drop          | discard, dump, reject          | drop (obj)                        | 1 |
--| | eat           |                                | eat (food)                        | 1 |
--| | empty         |                                | empty (obj)                       | 1 |
--| | empty_in      |                                | empty (obj) in (cont)             | 2 |
--| | empty_on      |                                | empty (obj) on (surface)          | 2 |
--| | enter         |                                | enter (obj)                       | 1 |
--| | examine       | X, check, inspect, observe     | examine (obj)                     | 1 |
--| | exit          |                                | exit (obj)                        | 1 |
--| | extinguish    | put out, quench                | extinguish (obj)                  | 1 |
--| | fill          |                                | fill (cont)                       | 1 |
--| | fill_with     |                                | fill (cont) with (substance)      | 2 |
--| | find          | locate                         | find (obj)                        | 1 |
--| | fire          |                                | fire (weapon)                     | 1 |
--| | fire_at       |                                | fire (weapon) at (target)         | 2 |
--| | fix           | mend, repair                   | fix (obj)                         | 1 |
--| | follow        |                                | follow (act)                      | 1 |
--| | free          | release                        | free (obj)                        | 1 |
--| | get_up        |                                | get up                            | 0 |
--| | get_off       |                                | get off (obj)                     | 1 |
--| | give          |                                | give (obj) to (recipient)         | 2 |
--| | go_to         |                                | go to (dest)                      | 1 |
--| | i             | inv, inventory                 | inventory                         | 0 |
--| | jump          |                                | jump                              | 0 |
--| | jump_in       |                                | jump in (cont)                    | 1 |
--| | jump_on       |                                | jump on (surface)                 | 1 |
--| | kick          |                                | kick (target)                     | 1 |
--| | kill          | murder                         | kill (victim)                     | 1 |
--| | kill_with     |                                | kill (victim) with (weapon)       | 2 |
--| | kiss          | hug, embrace                   | kiss (obj)                        | 1 |
--| | knock (on)    |                                | knock on (obj)                    | 1 |
--| | lie_down      |                                | lie down                          | 0 |
--| | lie_in        |                                | lie in (cont)                     | 1 |
--| | lie_on        |                                | lie on (surface)                  | 1 |
--| | lift          |                                | lift (obj)                        | 1 |
--| | light         | lit                            | light (obj)                       | 1 |
--| | listen0       |                                | listen                            | 0 |
--| | listen        |                                | listen to (obj)                   | 1 |
--| | lock          |                                | lock (obj)                        | 1 |
--| | lock_with     |                                | lock (obj) with (key)             | 2 |
--| | look          | gaze, peek                     | look                              | 0 |
--| | look_behind   |                                | look behind (bulk)                | 1 |
--| | look_in       |                                | look in (cont)                    | 1 |
--| | look_out_of   |                                | look out of (obj)                 | 1 |
--| | look_through  |                                | look through (bulk)               | 1 |
--| | look_under    |                                | look under (bulk)                 | 1 |
--| | look_up       |                                | look up                           | 0 |
--| | open          |                                | open (obj)                        | 1 |
--| | open_with     |                                | open (obj) with (instr)           | 2 |
--| | play          |                                | play (obj)                        | 1 |
--| | play_with     |                                | play with (obj)                   | 1 |
--| | pour          | (defined at `empty`)           | pour (obj)                        | 1 |
--| | pour_in       | (defined at `emtpy_in`)        | pour (obj) in (cont)              | 2 |
--| | pour_on       | (defined at `empty_on`)        | pour (obj) on (surface)           | 2 |
--| | pray          |                                | pray                              | 0 |
--| | pry           |                                | pry (obj)                         | 1 |
--| | pry_with      |                                | pry (obj) with (instr)            | 2 |
--| | pull          |                                | pull (obj)                        | 1 |
--| | push          |                                | push (obj)                        | 1 |
--| | push_with     |                                | push (obj) with (instr)           | 2 |
--| | put           | lay, place                     | put (obj)                         | 1 |
--| | put_against   |                                | put (obj) against (bulk))         | 2 |
--| | put_behind    |                                | put (obj) behind (bulk)           | 2 |
--| | put_down      | (defined at `drop`)            | put down (obj)                    | 1 |
--| | put_in        | insert                         | put (obj) in (cont)               | 2 |
--| | put_near      |                                | put (obj) near (bulk)             | 2 |
--| | put_on        |                                | put (obj) on (surface)            | 2 |
--| | put_under     |                                | put (obj) under (bulk)            | 2 |
--| | read          |                                | read (obj)                        | 1 |
--| | remove        |                                | remove (obj)                      | 1 |
--| | rub           |                                | rub (obj)                         | 1 |
--| | say           |                                | say (topic)                       | 1 |
--| | say_to        |                                | say (topic) to (act)              | 2 |
--| | score         |                                | score                             | 0 |
--| | scratch       |                                | scratch (obj)                     | 1 |
--| | search        |                                | search (obj)                      | 1 |
--| | sell          |                                | sell (item)                       | 1 |
--| | shake         |                                | shake (obj)                       | 1 |
--| | shoot (at)    |                                | shoot at (target)                 | 1 |
--| | shoot_with    |                                | shoot (target) with (weapon)      | 2 |
--| | shout         | scream, yell                   | shout                             | 0 |
--| | show          | reveal                         | show (obj) to (act)               | 2 |
--| | sing          |                                | sing                              | 0 |
--| | sip           |                                | sip (liq)                         | 1 |
--| | sit (down)    |                                | sit.  sit down.                   | 0 |
--| | sit_on        |                                | sit on (surface)                  | 1 |
--| | sleep         | rest                           | sleep                             | 0 |
--| | smell0        |                                | smell                             | 0 |
--| | smell         |                                | smell (odour)                     | 1 |
--| | squeeze       |                                | squeeze (obj)                     | 1 |
--| | stand (up)    |                                | stand.  stand up.                 | 0 |
--| | stand_on      |                                | stand on (surface)                | 1 |
--| | swim          |                                | swim                              | 0 |
--| | swim_in       |                                | swim in (liq)                     | 1 |
--| | switch        |                                | switch (obj)                      | 1 |
--| | switch_on     | (defined at `turn_on`)         | switch on (app)                   | 1 |
--| | switch_off    | (defined at `turn_off`)        | switch off (app)                  | 1 |
--| | take          | carry, get, grab, hold, obtain | take (obj)                        | 1 |
--| | take_from     | remove from                    | take (obj) from (holder)          | 2 |
--| | talk          |                                | talk                              | 0 |
--| | talk_to       | speak                          | talk to (act)                     | 1 |
--| | taste         | lick                           | taste (obj)                       | 1 |
--| | tear          | rip                            | tear (obj)                        | 1 |
--| | tell          | enlighten, inform              | tell (act) about (topic)          | 2 |
--| | think         |                                | think                             | 0 |
--| | think_about   |                                | think about (topic)               | 1 |
--| | throw         |                                | throw (projectile)                | 1 |
--| | throw_at      |                                | throw (projectile) at (target)    | 2 |
--| | throw_in      |                                | throw (projectile) in (cont)      | 2 |
--| | throw_to      |                                | throw (projectile) to (recipient) | 2 |
--| | tie           |                                | tie (obj)                         | 1 |
--| | tie_to        |                                | tie (obj) to (target)             | 2 |
--| | touch         | feel                           | touch (obj)                       | 1 |
--| | touch_with    | feel                           | touch (ogg) with (instr)          | 2 |
--| | turn          | rotate                         | turn (obj)                        | 1 |
--| | turn_on       |                                | turn on (app)                     | 1 |
--| | turn_off      |                                | turn off (app)                    | 1 |
--| | undress       |                                | undress                           | 0 |
--| | unlock        |                                | unlock (obj)                      | 1 |
--| | unlock_with   |                                | unlock (obj) with (key)           | 2 |
--| | use           |                                | use (obj)                         | 1 |
--| | use_with      |                                | use (obj) with (instr)            | 2 |
--| | wait          | Z                              | wait                              | 0 |
--| | wear          |                                | wear (obj)                        | 1 |
--| | write         |                                | write (txt) on (obj)              | 2 |
--| |===============================================================================================
--<



-- =============================================================


----- AGAIN (= g)


-- =============================================================


SYNTAX again = again.

SYNONYMS g = again.


VERB again
  CHECK my_game CAN 'again'
    ELSE SAY restricted_response OF my_game.
  DOES
    "[The AGAIN command is not supported in this game. As a workaround, try using
     the 'up' and 'down' arrow keys to scroll through your previous commands.]"
END VERB again.




-- =============================================================


----- ANSWER    (+ reply)


-- =============================================================


SYNTAX answer = answer (topic)
  WHERE topic ISA STRING
    ELSE SAY illegal_parameter_string OF my_game.

SYNONYMS reply = answer.

ADD TO EVERY STRING
  VERB answer
    CHECK my_game CAN answer
      ELSE SAY restricted_response OF my_game.
    DOES
      "What was the question?"
    END VERB answer.
END ADD TO.



-- =============================================================


----- ASK (= enquire, inquire, interrogate)


-- =============================================================


SYNTAX ask = ask (act) about (topic)!
  WHERE act ISA ACTOR
    ELSE
  IF act IS NOT plural
    THEN SAY illegal_parameter_talk_sg OF my_game.
    ELSE SAY illegal_parameter_talk_pl OF my_game.
  END IF.
  AND topic ISA THING
    ELSE
  IF topic IS NOT plural
    THEN SAY illegal_parameter_about_sg OF my_game.
    ELSE SAY illegal_parameter_about_pl OF my_game.
  END IF.

        ask = enquire (act) about (topic)!.

        ask = inquire (act) about (topic)!.

        ask = interrogate (act) about (topic)!.

  -- Above, we define the alternative verbs in the syntax rather than as synonyms,
  -- as the verb 'ask_for' below doesn't sound correct with these alternatives allowed.


ADD TO EVERY ACTOR
  VERB ask
    WHEN act
      CHECK my_game CAN ask
        ELSE SAY restricted_response OF my_game.
      AND act <> hero
        ELSE SAY check_obj_not_hero1 OF my_game.
      AND act CAN talk
        ELSE
          IF act IS NOT plural
            THEN SAY check_act_can_talk_sg OF my_game.
            ELSE SAY check_act_can_talk_pl OF my_game.
          END IF.
      AND act IS NOT distant
        ELSE
          IF act IS NOT plural
            THEN SAY check_obj_not_distant_sg OF my_game.
            ELSE SAY check_obj_not_distant_pl OF my_game.
          END IF.
      
      DOES
        "There is no reply."
  END VERB ask.
END ADD TO.



----- note that 'consult' is defined separately



-- =============================================================


----- ASK FOR


-- =============================================================


SYNTAX ask_for = ask (act) 'for' (obj)
  WHERE act ISA ACTOR
    ELSE
      IF act IS NOT plural
        THEN SAY illegal_parameter_talk_sg OF my_game.
        ELSE SAY illegal_parameter_talk_pl OF my_game.
      END IF.
  AND obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_for_sg OF my_game.
        ELSE SAY illegal_parameter_for_pl OF my_game.
      END IF.


ADD TO EVERY ACTOR
  VERB ask_for
    WHEN act
      CHECK my_game CAN ask_for
        ELSE SAY restricted_response OF my_game.
      AND act <> hero
        ELSE SAY check_obj_not_hero1 OF my_game.
      AND act CAN talk
        ELSE
          IF act IS NOT plural
            THEN SAY check_act_can_talk_sg OF my_game.
            ELSE SAY check_act_can_talk_pl OF my_game.
          END IF.
      AND obj IS examinable
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj2_suitable_for_sg OF my_game.
            ELSE SAY check_obj2_suitable_for_pl OF my_game.
          END IF.
      AND obj NOT IN hero
        ELSE SAY check_obj2_not_in_hero3 OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND act IS NOT distant
        ELSE
          IF act IS NOT plural
            THEN SAY check_obj_not_distant_sg OF my_game.
            ELSE SAY check_obj_not_distant_pl OF my_game.
          END IF.
      AND obj IS takeable
        ELSE SAY check_obj2_takeable2 OF my_game.

      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN SAY check_obj_reachable_ask OF my_game.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND obj IS NOT scenery
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj2_not_scenery_sg OF my_game.
            ELSE SAY check_obj2_not_scenery_pl OF my_game.
          END IF.

      DOES
        -- Let's preserve the current state of compliance of act:
        IF act IS compliant
          THEN MAKE my_game temp_compliant.
          ELSE MAKE my_game NOT temp_compliant.
        END IF.
        MAKE act compliant.
        -- It is only possible to get something from an NPC
        -- if the NPC is 'compliant'.
        LOCATE obj IN hero.
        MAKE obj NOT worn. -- for non-clothing wearables.
        SAY THE act. "gives" SAY THE obj. "to you."
        -- Now let's restore act to its original state of compliacne:
        IF my_game IS NOT temp_compliant
          THEN MAKE act NOT compliant.
        END IF.
  END VERB ask_for.
END ADD TO.



--- another 'ask_for' formulation added to guide players to use the right phrasing:


SYNTAX ask_for_error = ask 'for' (obj)
  WHERE obj ISA OBJECT
    ELSE "Please use the formulation ASK PERSON FOR THING to ask somebody for
          something."


ADD TO EVERY OBJECT
  VERB ask_for_error
    DOES
      "Please use the formulation ASK PERSON FOR THING to ask somebody for
       something."
  END VERB ask_for_error.
END ADD TO.



-- =============================================================


----- ATTACK (+ beat, fight, hit, punch)


-- =============================================================

-- Note that 'kick' is defined separately, to avoid absurd commands such as
-- 'kick man with sword' (see 'attack_with' below)

SYNTAX attack = attack (target)
  WHERE target ISA THING
    ELSE
      IF target IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

SYNONYMS beat, fight, hit, punch = attack.


ADD TO EVERY THING
  VERB attack
    CHECK my_game CAN attack
      ELSE SAY restricted_response OF my_game.
    AND target IS examinable
      ELSE
        IF target IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND target <> hero
      ELSE SAY check_obj_not_hero1 OF my_game.
    AND target NOT IN hero
      ELSE
        IF target IS NOT worn
          THEN SAY my_game:check_obj_not_in_hero1.
          ELSE SAY my_game:check_obj_not_in_worn2.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND target IS reachable AND target IS NOT distant
      ELSE
        IF target IS NOT reachable
          THEN
            IF target IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF target IS distant
          THEN
            IF target IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.
    AND hero IS NOT sitting
      ELSE SAY check_hero_not_sitting2 OF my_game.
    AND hero IS NOT lying_down
      ELSE SAY check_hero_not_lying_down2 OF my_game.

    DOES
      "Resorting to brute force is not the solution here."
  END VERB attack.
END ADD TO.





-- ==============================================================


----- ATTACK WITH


-- ==============================================================


SYNTAX attack_with = attack (target) 'with' (weapon)
  WHERE target ISA THING
    ELSE
      IF target IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND weapon ISA WEAPON
    ELSE
      IF weapon IS NOT plural
        THEN SAY illegal_parameter2_with_sg OF my_game.
        ELSE SAY illegal_parameter2_with_pl OF my_game.
      END IF.



ADD TO EVERY THING
  VERB attack_with
    WHEN target
      CHECK my_game CAN attack_with
        ELSE SAY restricted_response OF my_game.
      AND target IS examinable
        ELSE
          IF target IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND target <> weapon
        ELSE SAY check_obj_not_obj2_with OF my_game.
      AND target <> hero
        ELSE SAY check_obj_not_hero1 OF my_game.
      AND target NOT IN hero
        ELSE
          IF target IS NOT worn
            THEN SAY my_game:check_obj_not_in_hero1.
            ELSE SAY my_game:check_obj_not_in_worn2.
          END IF.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND target IS reachable AND target IS NOT distant
        ELSE
          IF target IS NOT reachable
            THEN
              IF target IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF target IS distant
            THEN
              IF target IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND hero IS NOT sitting
        ELSE SAY check_hero_not_sitting2 OF my_game.
      AND hero IS NOT lying_down
        ELSE SAY check_hero_not_lying_down2 OF my_game.

    DOES
      "Resorting to brute force is not the solution here."
  END VERB attack_with.
END ADD TO.



-- ===============================================================


----- BITE  (+ chew)


-- ===============================================================


SYNTAX bite = bite (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

SYNONYMS chew = bite.


ADD TO EVERY OBJECT
  VERB bite
    CHECK my_game CAN bite
      ELSE SAY restricted_response OF my_game.
    AND obj IS edible
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND obj IS takeable
      ELSE SAY check_obj_takeable OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS NOT distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      -- This if-statement takes care of implicit taking; i.e. if the hero
      -- doesn't have the object, (s)he will take it automatically first
      -- - unless it's carried by another actor.
      -- This same if-statement is found in numerous other verbs throughout
      -- the library, as well.

      -- >>> implicit take >>>
      IF obj NOT DIRECTLY IN hero
        THEN LOCATE obj IN hero.
             SAY implicit_taking_message OF my_game.
      END IF.
      -- <<< implicit take <<<

      "You take a bite of" SAY THE obj. "$$."
        IF obj IS NOT plural
          THEN "It tastes nothing out of the ordinary."
          ELSE "They taste nothing out of the ordinary."
        END IF.

  END VERB bite.
END ADD TO.




-- ===============================================================


----- BREAK


-- ===============================================================


SYNTAX break = break (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

SYNONYMS destroy = break.


ADD TO EVERY OBJECT
  VERB break
    CHECK my_game CAN break
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "Resorting to brute force is not the solution here."
  END VERB break.
END ADD TO.




-- ===============================================================


----- BREAK WITH


-- ===============================================================


SYNTAX break_with = break (obj) 'with' (instr)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND instr ISA OBJECT
    ELSE
      IF instr IS NOT plural
        THEN SAY illegal_parameter2_with_sg OF my_game.
        ELSE SAY illegal_parameter2_with_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB break_with
    WHEN obj
      CHECK my_game CAN break_with
        ELSE SAY restricted_response OF my_game.
      AND obj IS examinable
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND instr IS examinable
        ELSE
          IF instr IS NOT plural
            THEN SAY check_obj2_suitable_with_sg OF my_game.
            ELSE SAY check_obj2_suitable_with_pl OF my_game.
          END IF.
      AND obj <> instr
        ELSE SAY check_obj_not_obj2_with OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND instr IN hero
        ELSE SAY check_obj2_in_hero OF my_game.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.

      DOES
        "Trying to break" SAY THE obj. "with" SAY THE instr.
        "wouldn't accomplish anything."
  END VERB break_with.
END ADD TO.



-- =================================================================


----- BURN


-- =================================================================


SYNTAX burn = burn (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB burn
    CHECK my_game CAN burn
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.

    DOES
      "You must state what you want to burn" SAY THE obj. "with."
  END VERB burn.
END ADD TO.



-- =================================================================


----- BURN WITH


-- =================================================================


SYNTAX burn_with = burn (obj) 'with' (instr)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND instr ISA OBJECT
    ELSE
      IF instr IS NOT plural
        THEN SAY illegal_parameter2_with_sg OF my_game.
        ELSE SAY illegal_parameter2_with_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB burn_with
    WHEN obj
      CHECK my_game CAN burn_with
        ELSE SAY restricted_response OF my_game.
      AND obj IS examinable
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND instr IS examinable
        ELSE
          IF instr IS NOT plural
            THEN SAY check_obj2_suitable_with_sg OF my_game.
            ELSE SAY check_obj2_suitable_with_pl OF my_game.
          END IF.
      AND obj <> instr
        ELSE SAY check_obj_not_obj2_with OF my_game.
      AND instr IN hero
        ELSE SAY check_obj2_in_hero OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.

      DOES
        "You can't burn" SAY THE obj. "with" SAY THE instr. "."
  END VERB burn_with.
END ADD TO.



-- ==================================================================


----- BUY (+ purchase)


-- ==================================================================


SYNTAX buy = buy (item)
  WHERE item ISA OBJECT
    ELSE
      IF item IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

SYNONYMS purchase = buy.


ADD TO EVERY OBJECT
  VERB buy
    CHECK my_game CAN buy
      ELSE SAY restricted_response OF my_game.
    AND item IS examinable
      ELSE
        IF item IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.

    DOES
      IF item IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "for sale."
  END VERB buy.
END ADD TO.




-- ==================================================================


----- CATCH


-- ==================================================================


SYNTAX catch = catch (obj)
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY THING
  VERB catch
    CHECK my_game CAN catch
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND obj <> hero
      ELSE SAY check_obj_not_hero1 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND hero IS NOT sitting
      ELSE SAY check_hero_not_sitting2 OF my_game.
    AND hero IS NOT lying_down
      ELSE SAY check_hero_not_lying_down2 OF my_game.

    DOES
      IF obj IS NOT plural
        THEN "That doesn't"
        ELSE "Those don't"
      END IF.
      "need to be caught."
  END VERB catch.
END ADD TO.



-- ==================================================================


----- CLEAN ( + wipe, polish)


-- ==================================================================

----- notice that 'rub' is defined separately

SYNTAX clean = clean (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


SYNONYMS wipe, polish = clean.


ADD TO EVERY OBJECT
  VERB clean
    CHECK my_game CAN clean
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "Nothing would be achieved by that."
  END VERB clean.
END ADD TO.




-- ==============================================================


----- CLIMB


-- ==============================================================


SYNTAX climb = climb (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.



ADD TO EVERY OBJECT
  VERB climb
    CHECK my_game CAN climb
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
    AND hero IS NOT sitting
      ELSE SAY check_hero_not_sitting3 OF my_game.
    AND hero IS NOT lying_down
      ELSE SAY check_hero_not_lying_down3 OF my_game.

    DOES
      IF obj IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "something you can climb."
  END VERB climb.
END ADD TO.



-- ==============================================================


----- CLIMB ON


-- ==============================================================


SYNTAX climb_on = climb 'on' (surface)
  WHERE surface ISA SUPPORTER
    ELSE
      IF surface IS NOT plural
        THEN SAY illegal_parameter_on_sg OF my_game.
        ELSE SAY illegal_parameter_on_pl OF my_game.
      END IF.


ADD TO EVERY SUPPORTER
  VERB climb_on
    CHECK my_game CAN climb_on
      ELSE SAY restricted_response OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND surface IS reachable AND surface IS NOT distant
      ELSE
        IF surface IS NOT reachable
          THEN
            IF surface IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF surface IS NOT distant
          THEN
            IF surface IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.
    AND hero IS NOT sitting
      ELSE SAY check_hero_not_sitting3 OF my_game.
    AND hero IS NOT lying_down
      ELSE SAY check_hero_not_lying_down3 OF my_game.

    DOES
      IF surface IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "something you can climb on."
  END VERB climb_on.
END ADD TO.



-- ==============================================================


----- CLIMB THROUGH


-- ==============================================================


SYNTAX climb_through = climb through (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB climb_through
    CHECK my_game CAN climb_through
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.
    AND hero IS NOT sitting
      ELSE SAY check_hero_not_sitting3 OF my_game.
    AND hero IS NOT lying_down
      ELSE SAY check_hero_not_lying_down3 OF my_game.

    DOES
      IF obj IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "something you can climb through."
  END VERB climb_through.
END ADD TO.



-- ==============================================================


----- CLOSE (+ shut)


-- ==============================================================


SYNTAX close = close (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


SYNONYMS shut = close.


ADD TO EVERY OBJECT
  VERB close
    CHECK my_game CAN close
      ELSE SAY restricted_response OF my_game.
    AND obj IS openable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.
    AND obj IS open
          ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_open1_sg OF my_game.
          ELSE SAY check_obj_open1_pl OF my_game.
        END IF.

    DOES
      MAKE obj NOT open.
      "You close" SAY THE obj. "."
  END VERB close.
END ADD TO.



-- ==============================================================


----- CLOSE WITH


-- ==============================================================


SYNTAX close_with = close (obj) 'with' (instr)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND instr ISA OBJECT
    ELSE
      IF instr IS NOT plural
        THEN SAY illegal_parameter2_with_sg OF my_game.
        ELSE SAY illegal_parameter2_with_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB close_with
    WHEN obj
      CHECK my_game CAN close_with
        ELSE SAY restricted_response OF my_game.
      AND obj IS openable
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND instr IS examinable
        ELSE
          IF instr IS NOT plural
            THEN SAY check_obj2_suitable_with_sg OF my_game.
            ELSE SAY check_obj2_suitable_with_pl OF my_game.
          END IF.
      AND obj <> instr
        ELSE SAY check_obj_not_obj2_with OF my_game.
      AND instr IN hero
        ELSE SAY check_obj2_in_hero OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
        END IF.
      AND obj IS open
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_open1_sg OF my_game.
            ELSE SAY check_obj_open1_pl OF my_game.
          END IF.

      DOES
        "You can't $v" SAY THE obj. "with" SAY THE instr. "."
  END VERB close_with.
END ADD TO.



-- ==============================================================


----- CONSULT


-- ==============================================================


SYNTAX consult = consult (source) about (topic)!
  WHERE source ISA OBJECT
    -- you can only consult an inanimate source, not a person.
    ELSE
      IF source IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND topic ISA THING
    ELSE
      IF topic IS NOT plural
        THEN SAY illegal_parameter_consult_sg OF my_game.
        ELSE SAY illegal_parameter_consult_pl OF my_game.
      END IF.

  consult = 'look' 'up' (topic) 'in' (source).


ADD TO EVERY THING
  VERB consult
    WHEN source
      CHECK my_game CAN consult
        ELSE SAY restricted_response OF my_game.
      AND source IS examinable
        ELSE
          IF source IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND source IS reachable AND source IS NOT distant
        ELSE
          IF source IS NOT reachable
            THEN
              IF source IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF source IS distant
            THEN
              IF source IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.

      DOES
        "You find nothing useful about" SAY THE topic. "in" SAY THE source. "."
  END VERB consult.
END ADD TO.


--- another 'consult' formulation added to guide players to use the right phrasing:


SYNTAX consult_error = consult (source)
  WHERE source ISA THING
    ELSE "To consult something, please use the formulation CONSULT THING ABOUT
          PERSON/THING."


ADD TO EVERY THING
  VERB consult_error
    DOES
      "To consult something, please use the formulation CONSULT THING ABOUT
       PERSON/THING."
  END VERB consult_error.
END ADD TO.





-- ==============================================================


----- CUT


-- ==============================================================


SYNTAX cut = cut (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB cut
    CHECK my_game CAN cut
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.

    DOES "You need to specify what you want to cut" SAY THE obj. "with."
  END VERB cut.
END ADD TO.



-- ==============================================================


----- CUT WITH


-- ==============================================================


SYNTAX cut_with = cut (obj) 'with' (instr)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND instr ISA OBJECT
    ELSE
      IF instr IS NOT plural
        THEN SAY illegal_parameter2_with_sg OF my_game.
        ELSE SAY illegal_parameter2_with_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB cut_with
    WHEN obj
      CHECK my_game CAN cut_with
        ELSE SAY restricted_response OF my_game.
      AND obj <> instr
        ELSE SAY check_obj_not_obj2_with OF my_game.
      AND obj IS examinable
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND instr IS examinable
        ELSE
          IF instr IS NOT plural
            THEN SAY check_obj2_suitable_with_sg OF my_game.
            ELSE SAY check_obj2_suitable_with_pl OF my_game.
          END IF.
      AND instr IN hero
        ELSE SAY check_obj2_in_hero OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.

      DOES
        "You can't cut" SAY THE obj. "with" SAY THE instr. "."
  END VERB cut_with.
END ADD TO.



-- ==============================================================


----- DANCE


-- ==============================================================


SYNTAX dance = dance.


VERB dance
  CHECK my_game CAN dance
    ELSE SAY restricted_response OF my_game.
  AND CURRENT LOCATION IS lit
    ELSE SAY check_current_loc_lit OF my_game.
  AND hero IS NOT sitting
    ELSE SAY check_hero_not_sitting1 OF my_game.
  AND hero IS NOT lying_down
    ELSE SAY check_hero_not_lying_down1 OF my_game.

  DOES
    "How about a waltz?"
END VERB dance.



-- ==============================================================


----- DIG


-- ==============================================================


SYNTAX dig = dig (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB dig
    CHECK my_game CAN dig
      ELSE SAY restricted_response OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.
    AND hero IS NOT sitting
      ELSE SAY check_hero_not_sitting2 OF my_game.
    AND hero IS NOT lying_down
      ELSE SAY check_hero_not_lying_down2 OF my_game.

    DOES
      "There is nothing suitable to dig here."
  END VERB dig.
END ADD TO.



-- ==============================================================


----- DIVE


-- ==============================================================


SYNTAX dive = dive.


VERB dive
  CHECK my_game CAN dive
    ELSE SAY restricted_response OF my_game.
  AND CURRENT LOCATION IS lit
    ELSE SAY check_current_loc_lit OF my_game.
  AND hero IS NOT sitting
    ELSE SAY check_hero_not_sitting3 OF my_game.
  AND hero IS NOT lying_down
    ELSE SAY check_hero_not_lying_down3 OF my_game.

  DOES
    "There is no water suitable for swimming here."
END VERB dive.



-- ==============================================================


----- DIVE IN


-- ==============================================================


SYNTAX dive_in = dive 'in' (liq)
  WHERE liq ISA LIQUID    -- see 'classes.i'
    ELSE
      IF liq IS NOT plural
        THEN SAY illegal_parameter_in_sg OF my_game.
        ELSE SAY illegal_parameter_in_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB dive_in
    CHECK my_game CAN dive_in
      ELSE SAY restricted_response OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND hero IS NOT sitting
      ELSE SAY check_hero_not_sitting3 OF my_game.
    AND hero IS NOT lying_down
      ELSE SAY check_hero_not_lying_down3 OF my_game.
    -- notice that, unlike 'swim_in', it is possible to dive in a
    -- not reachable object (for example from a clifftop into a river)
    -- but not to a distant object:
    AND liq IS NOT distant
      ELSE
        IF liq IS NOT plural
          THEN SAY check_obj_not_distant_sg OF my_game.
          ELSE SAY check_obj_not_distant_pl OF my_game.
        END IF.

    DOES
      IF liq IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "something you can dive in."
  END VERB dive_in.
END ADD TO.



-- ==============================================================


----- DRINK


-- ==============================================================


SYNTAX drink = drink (liq)
  WHERE liq ISA LIQUID    -- see 'classes.i'
    ELSE
      IF liq IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY LIQUID
  VERB drink
    CHECK my_game CAN drink
      ELSE SAY restricted_response OF my_game.
    AND liq IS drinkable
      ELSE
        IF liq IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND liq IS reachable AND liq IS NOT distant
      ELSE
        IF liq IS NOT reachable
          THEN
            IF liq IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF liq IS distant
          THEN
            IF liq IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      IF vessel OF liq = null_vessel
        -- here, if the liquid is in no container, for
        -- example the hero takes a sip of water from a river,
        -- the action is allowed to succeed so that the hero
        -- drinks some of the liquid:

        THEN "You drink a bit of" SAY THE liq. "."
        ELSE
          -- = if the liquid is in a container:

          -- >>> implicit take >>>
          IF vessel OF liq NOT DIRECTLY IN hero
            THEN
              IF vessel OF liq IS NOT takeable
                THEN "You can't carry" SAY THE liq. "around in your bare hands."
                  -- the action stops here if the container is not takeable.
                ELSE
                  LOCATE vessel OF liq IN hero.
                  "(taking" SAY THE vessel OF THIS. "of" SAY THIS. "first)$n"
              END IF.
          END IF.
          -- <<< implicit take <<<

          IF liq IN hero
            -- i.e. if the implicit taking was successful
            THEN
              "You drink all of" SAY THE liq. "."
              LOCATE liq AT nowhere.
          END IF.
      END IF.
  END VERB drink.
END ADD TO.


-- Note that the verb 'sip' is defined separately, with a slightly different behaviour.



-- ==============================================================


----- DRIVE


-- ==============================================================


SYNTAX drive = drive (vehicle)
  WHERE vehicle ISA OBJECT
    ELSE
      IF vehicle IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB drive
    CHECK my_game CAN drive
      ELSE SAY restricted_response OF my_game.
    AND vehicle IS examinable
      ELSE
        IF vehicle IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND vehicle IS reachable AND vehicle IS NOT distant
      ELSE
        IF vehicle IS NOT reachable
          THEN
            IF vehicle IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF vehicle IS distant
          THEN
            IF vehicle IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.
    AND hero IS NOT lying_down
      ELSE SAY check_hero_not_lying_down3 OF my_game.

    DOES
      IF vehicle IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "something you can drive."
  END VERB drive.
END ADD TO.


-- another 'drive' formulation added to guide players to use the right phrasing:


SYNTAX drive_error = drive.


VERB drive_error
  DOES "To drive something, use the phrasing DRIVE SOMETHING."
END VERB drive_error.



-- ==============================================================


----- DROP


-- ==============================================================


SYNTAX drop = drop (obj)*
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

        drop = put (obj) * down.

        drop = put down (obj)*.

SYNONYMS discard, dump, reject = drop.

ADD TO EVERY OBJECT
  VERB drop
    CHECK my_game CAN drop
      ELSE SAY restricted_response OF my_game.
    AND obj IN hero
      ELSE SAY check_obj_in_hero OF my_game.
    AND obj IS NOT worn -- protect non-clothing wearables
      ELSE SAY check_obj_not_in_worn3 OF my_game.

    DOES
      LOCATE obj HERE.
      "Dropped."
  END VERB drop.
END ADD TO.





-- ==============================================================


----- EAT


-- ==============================================================


SYNTAX eat = eat (food)
  WHERE food ISA OBJECT
    ELSE
      IF food IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB eat
    CHECK my_game CAN eat
      ELSE SAY restricted_response OF my_game.
    AND food IS edible
      ELSE
        IF food IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND food IS takeable
      ELSE SAY check_obj_takeable OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND food IS reachable AND food IS NOT distant
      ELSE
        IF food IS NOT reachable
          THEN
            IF food IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF food IS distant
          THEN
            IF food IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      -- >>> implicit take >>>
      IF food NOT DIRECTLY IN hero
        THEN LOCATE food IN hero.
             SAY implicit_taking_message OF my_game.
      END IF.
      -- <<< implicit take <<<

      "You eat all of" SAY THE food. "."
      LOCATE food AT nowhere.

  END VERB eat.
END ADD.



-- ==============================================================


----- EMPTY   (+ POUR)


-- ==============================================================


-- The verbs 'empty' and 'pour' have similar syntaxes and behaviour here. They are, however,
-- not declared as synonyms but kept separate, as their usage doesn't overlap 100%; for example
-- you can pour liquids but not empty them.
-- That's why in 'classes.i', liquids are defined only to work with the verb 'pour',
-- and the verb 'empty' is disabled for liquids.




SYNTAX 'empty' = 'empty' (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND obj ISA CONTAINER
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

  pour = pour (obj)
    WHERE obj ISA OBJECT
      ELSE
        IF obj IS NOT plural
          THEN SAY illegal_parameter_sg OF my_game.
          ELSE SAY illegal_parameter_pl OF my_game.
        END IF.
    AND obj ISA CONTAINER
      ELSE
        IF obj IS NOT plural
          THEN SAY illegal_parameter_sg OF my_game.
          ELSE SAY illegal_parameter_pl OF my_game.
        END IF.


ADD TO EVERY OBJECT
  VERB 'empty', pour
    CHECK my_game CAN 'empty' AND my_game CAN pour
      ELSE SAY restricted_response OF my_game.
    AND obj IS takeable
      ELSE SAY check_obj_takeable OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.
    AND obj IS open
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_open2_sg OF my_game.
          ELSE SAY check_obj_open2_pl OF my_game.
        END IF.

    DOES
      -- >>> implicit take >>>
      IF obj NOT DIRECTLY IN hero
        THEN LOCATE obj IN hero.
          SAY implicit_taking_message OF my_game.
      END IF.
      -- <<< implicit take <<<

      IF COUNT ISA OBJECT, DIRECTLY IN obj = 0
        THEN "There is nothing in" SAY THE obj. "."
        ELSE
          "You $v the contents of" SAY THE obj.
            IF floor HERE
              THEN "on the floor."
              ELSE "on the ground."
            END IF.
          EMPTY obj AT hero.
      END IF.

  END VERB 'empty'.
END ADD TO.



-- ==============================================================


----- EMPTY IN  (+ POUR IN)


-- ==============================================================



SYNTAX empty_in = 'empty' (obj) 'in' (cont)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND obj ISA CONTAINER
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND cont ISA OBJECT
    ELSE
      IF cont ISA ACTOR
        THEN SAY illegal_parameter_act OF my_game.
        ELSE SAY illegal_parameter2_there OF my_game.
      END IF.
  AND cont ISA CONTAINER
    ELSE SAY illegal_parameter2_there OF my_game.



pour_in = pour (obj) 'in' (cont)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND obj ISA CONTAINER
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND cont ISA OBJECT
    ELSE
      IF cont ISA ACTOR
        THEN SAY illegal_parameter_act OF my_game.
        ELSE SAY illegal_parameter2_there OF my_game.
      END IF.
  AND cont ISA CONTAINER
    ELSE SAY illegal_parameter2_there OF my_game.




ADD TO EVERY OBJECT
  VERB empty_in, pour_in
    WHEN obj
      CHECK my_game CAN empty_in AND my_game CAN pour_in
        ELSE SAY restricted_response OF my_game.
      AND obj <> cont
        ELSE SAY check_obj_not_obj2_in OF my_game.
      AND obj IS takeable
        ELSE SAY check_obj_takeable OF my_game.
      AND cont NOT IN obj
        ELSE SAY check_cont_not_in_obj OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND cont IS reachable AND cont IS NOT distant
        ELSE
          IF cont IS NOT reachable
            THEN
              IF cont IS NOT plural
                THEN SAY check_obj2_reachable_sg OF my_game.
                ELSE SAY check_obj2_reachable_pl OF my_game.
              END IF.
          ELSIF cont IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj2_not_distant_sg OF my_game.
                ELSE SAY check_obj2_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND obj IN allowed OF cont
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_allowed_in_sg OF my_game.
            ELSE SAY check_obj_allowed_in_pl OF my_game.
          END IF.
      AND obj IS open
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_open2_sg OF my_game.
            ELSE SAY check_obj_open2_pl OF my_game.
          END IF.
      AND cont IS open
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj2_open_sg OF my_game.
            ELSE SAY check_obj2_open_pl OF my_game.
          END IF.

      DOES
      -- >>> implicit take >>>
      IF obj NOT DIRECTLY IN hero
        THEN LOCATE obj IN hero.
          SAY implicit_taking_message OF my_game.
      END IF.
      -- <<< implicit take <<<

      IF COUNT ISA OBJECT, DIRECTLY IN obj = 0
        THEN "There is nothing in" SAY THE obj. "."
        ELSE
          EMPTY obj IN cont.
          "You $v the contents of" SAY THE obj.
          "in" SAY THE cont. "."
      END IF.
  END VERB empty_in.
END ADD TO.



-- ==============================================================


----- EMPTY ON  (+ POUR ON)


-- ==============================================================



SYNTAX empty_on = 'empty' (obj) 'on' (surface)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND obj ISA CONTAINER
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND surface ISA THING
    ELSE SAY illegal_parameter2_there OF my_game.
  AND surface ISA CONTAINER
    ELSE SAY illegal_parameter2_there OF my_game.

  pour_on = pour (obj) 'on' (surface)
    WHERE obj ISA OBJECT
      ELSE
        IF obj IS NOT plural
          THEN SAY illegal_parameter_sg OF my_game.
          ELSE SAY illegal_parameter_pl OF my_game.
        END IF.
    AND obj ISA CONTAINER
      ELSE
        IF obj IS NOT plural
          THEN SAY illegal_parameter_sg OF my_game.
          ELSE SAY illegal_parameter_pl OF my_game.
        END IF.
    AND surface ISA OBJECT
      ELSE SAY illegal_parameter2_there OF my_game.
    AND surface ISA CONTAINER
      ELSE SAY illegal_parameter2_there OF my_game.


ADD TO EVERY THING
  VERB empty_on, pour_on
    WHEN obj
      CHECK my_game CAN empty_on AND my_game CAN pour_on
        ELSE SAY restricted_response OF my_game.
      AND obj <> surface
        ELSE SAY check_obj_not_obj2_on OF my_game.
      AND obj IS takeable
        ELSE SAY check_obj_takeable OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND surface IS reachable AND surface IS NOT distant
        ELSE
          IF surface IS NOT reachable
            THEN
              IF surface IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF surface IS distant
            THEN
              IF surface IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND obj IS open
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_open2_sg OF my_game.
            ELSE SAY check_obj_open2_pl OF my_game.
          END IF.

      DOES
        -- >>> implicit take >>>
        IF obj NOT DIRECTLY IN hero
          THEN LOCATE obj IN hero.
            SAY implicit_taking_message OF my_game.
        END IF.
        -- <<< implicit take <<<

        IF COUNT ISA OBJECT, DIRECTLY IN obj = 0
          THEN "There is nothing in" SAY THE obj. "."
          ELSE
            IF surface = floor OR surface = ground
              THEN EMPTY obj AT hero.
              ELSE EMPTY obj IN surface.
            END IF.
            "You $v the contents of" SAY THE obj.
            "on" SAY THE surface. "."
        END IF.
  END VERB empty_on.
END ADD TO.



-- ==============================================================


----- ENTER


-- ==============================================================


-- In the present version of ALAN, actors cannot enter containers.
-- You can simulate the hero entering a container by making the 'container'
-- a nested location and locating the hero there in the DOES ONLY
-- section of this verb under the instance at hand.


SYNTAX enter = enter (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.



ADD TO EVERY OBJECT
  VERB enter
    CHECK my_game CAN enter
      ELSE SAY restricted_response OF my_game.
    AND hero IS NOT sitting
      ELSE SAY check_hero_not_sitting2 OF my_game.
    AND hero IS NOT lying_down
      ELSE SAY check_hero_not_lying_down2 OF my_game.

    DOES
      IF obj IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "something you can enter."
  END VERB enter.
END ADD TO.


--- another 'enter' formulation declared to guide players to use the right formulation:


SYNTAX enter_error = enter.


VERB enter_error
  DOES "You must state what you want to enter."
END VERB enter_error.



-- ==============================================================


----- EXAMINE (+ look at)


-- ==============================================================


SYNTAX examine = examine (obj)
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_examine_sg OF my_game.
        ELSE SAY illegal_parameter_examine_pl OF my_game.
      END IF.


        examine = 'look' 'at' (obj).

        examine = 'look' (obj).
        -- note that this formulation is allowed, too

SYNONYMS 'check', inspect, observe, x = examine.


ADD TO EVERY THING
  VERB examine
    CHECK my_game CAN examine
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_examine_sg OF my_game.
          ELSE SAY check_obj_suitable_examine_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS NOT scenery
      ELSE
        IF obj IS NOT PLURAL
          THEN SAY check_obj_not_scenery_sg OF my_game.
          ELSE SAY check_obj_not_scenery_pl OF my_game.
        END IF.

    DOES
      IF obj IS readable
      -- for readable objects, 'examine' behaves just as 'read'
        THEN
          IF text OF obj = ""
            THEN "There is nothing written on" SAY THE obj. "."
            ELSE "You read" SAY THE obj. "."
              IF obj IS NOT plural
                THEN "It says"
                ELSE "They say"
              END IF.
              """$$" SAY text OF obj. "$$""."
          END IF.
        ELSE
          IF ex OF obj <> ""
            THEN SAY ex OF obj.
          ELSIF obj = hero
            THEN "You notice nothing unusual about yourself."
            ELSE "You notice nothing unusual about" SAY THE obj. "."
          END IF.
      END IF.
  END VERB examine.
END ADD TO.




-- ==============================================================


----- EXIT


-- ==============================================================

-- In the present version of ALAN, actors are not allowed inside containers.

-- You can simulate the hero exiting something by modifying the default
-- response below in the DOES ONLY part of this verb under the instance at hand.


SYNTAX 'exit' = 'exit' (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.



ADD TO EVERY OBJECT
  VERB 'exit'
    CHECK my_game CAN 'exit'
      ELSE SAY restricted_response OF my_game.

    DOES
      IF obj IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "something you can exit."
  END VERB 'exit'.
END ADD TO.


--- another 'exit' formulation added to guide players to use the right formulation:


SYNTAX exit_error = 'exit'.


VERB exit_error
  DOES
    "You must state what you want to exit."
END VERB exit_error.



-- ==============================================================


----- EXTINGUISH  (+ put out)


-- ==============================================================



SYNTAX extinguish = extinguish (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

        extinguish = put 'out' (obj).

        extinguish = put (obj) 'out'.

SYNONYMS quench = extinguish.


ADD TO EVERY OBJECT
  VERB extinguish
    CHECK my_game CAN extinguish
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      IF obj IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "on fire."
  END VERB extinguish.
END ADD TO.




-- ==============================================================


----- FILL


-- ==============================================================


SYNTAX fill = fill (cont)
  WHERE cont ISA OBJECT
    ELSE
      IF cont IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND cont ISA CONTAINER
    ELSE
      IF cont IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB fill
    CHECK my_game CAN fill
      ELSE SAY restricted_response OF my_game.
    AND cont IS examinable
      ELSE
        IF cont IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.

    DOES
      "You have to say what you want to fill" SAY THE cont. "with."
  END VERB fill.
END ADD TO.



-- ==============================================================


----- FILL WITH


-- ==============================================================


SYNTAX fill_with = fill (cont) 'with' (substance)
  WHERE cont ISA OBJECT
    ELSE
      IF cont IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND cont ISA CONTAINER
    ELSE
      IF cont IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND substance ISA OBJECT
    ELSE
      IF substance IS NOT plural
        THEN SAY illegal_parameter2_with_sg OF my_game.
        ELSE SAY illegal_parameter2_with_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB fill_with
    WHEN cont
      CHECK my_game CAN fill_with
        ELSE SAY restricted_response OF my_game.
      AND cont <> substance
        ELSE SAY check_obj_not_obj2_with OF my_game.
      AND substance IS examinable
        ELSE
          IF substance IS NOT plural
            THEN SAY check_obj2_suitable_with_sg OF my_game.
            ELSE SAY check_obj2_suitable_with_pl OF my_game.
          END IF.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND substance NOT IN cont
        ELSE SAY check_obj_not_in_cont2 OF my_game.
      AND substance IS takeable
        ELSE SAY check_obj2_takeable1 OF my_game.
      AND cont IS reachable AND cont IS NOT distant
        ELSE
          IF cont IS NOT reachable
            THEN
              IF cont IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF cont IS distant
            THEN
              IF cont IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game. "."
                ELSE SAY check_obj_not_distant_pl OF my_game. "."
              END IF.
          END IF.
      AND substance IS reachable AND substance IS NOT distant
        ELSE
          IF substance IS NOT reachable
            THEN
              IF substance IS NOT plural
                THEN SAY check_obj2_reachable_sg OF my_game.
                ELSE SAY check_obj2_reachable_pl OF my_game.
              END IF.
          ELSIF substance IS distant
            THEN
              IF substance IS NOT plural
                THEN SAY check_obj2_not_distant_sg OF my_game. "."
                ELSE SAY check_obj2_not_distant_pl OF my_game. "."
              END IF.
          END IF.

      DOES
        "You can't fill" SAY THE cont. "with" SAY THE substance. "."
        -- allow the action at individual substances only
  END VERB fill_with.
END ADD TO.



-- ==============================================================


----- FIND


-- ==============================================================


SYNTAX
  find = find (obj)!
    WHERE obj ISA THING
      ELSE
        IF obj IS NOT plural
          THEN SAY illegal_parameter_sg OF my_game.
          ELSE SAY illegal_parameter_pl OF my_game.
        END IF.

SYNONYMS 'locate' = find.


ADD TO EVERY THING
  VERB find
    CHECK my_game CAN find
      ELSE SAY restricted_response OF my_game.
    AND obj <> hero
      ELSE SAY check_obj_not_hero4 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj NOT AT hero
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_not_at_hero_sg OF my_game.
          ELSE SAY check_obj_not_at_hero_pl OF my_game.
        END IF.

    DOES
      "You'll have to $v it yourself."
  END VERB find.
END ADD TO.




-- ==============================================================


----- FIRE


-- ==============================================================


SYNTAX fire = fire (weapon)
  WHERE weapon ISA WEAPON
    ELSE
      IF weapon IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY WEAPON
  VERB fire
    CHECK my_game CAN fire
      ELSE SAY restricted_response OF my_game.
    AND weapon IS fireable
      ELSE
        IF weapon IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.

    DOES
      "You fire" SAY THE weapon. "into the air."
  END VERB fire.
END ADD TO.



-- ==============================================================


----- FIRE AT


-- ==============================================================


SYNTAX fire_at = fire (weapon) 'at' (target)
  WHERE weapon ISA WEAPON
    ELSE
      IF weapon IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND target ISA THING
    ELSE SAY illegal_parameter_at OF my_game.



ADD TO EVERY WEAPON
  VERB fire_at
    WHEN weapon
      CHECK my_game CAN fire_at
        ELSE SAY restricted_response OF my_game.
      AND weapon IS fireable
        ELSE
          IF weapon IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND target IS examinable
        ELSE SAY check_obj_suitable_at OF my_game.
      AND weapon <> target
        ELSE SAY check_obj_not_obj2_at OF my_game.
      AND target <> hero
        ELSE SAY check_obj_not_hero2 OF my_game.
      AND target IS NOT distant
        -- note that it is possible to fire at a "not reachable" target
        ELSE
          IF target IS NOT plural
            THEN SAY check_obj_not_distant_sg OF my_game.
            ELSE SAY check_obj_not_distant_pl OF my_game.
          END IF.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.

      DOES
        "Resorting to violence is not the solution here."
  END VERB fire_at.
END ADD TO.


-- another formulation added:


SYNTAX fire_at_error = fire 'at' (target)
  WHERE target ISA THING
    ELSE
      IF target IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY THING
  VERB fire_at_error
    CHECK COUNT ISA WEAPON, IS fireable, DIRECTLY IN hero > 0
      ELSE SAY check_count_weapon_in_hero OF my_game.
    AND target <> hero
      ELSE SAY check_obj_not_hero2 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.

    DOES
      "Resorting to violence is not the solution here."
  END VERB fire_at_error.
END ADD TO.



-- ==============================================================


----- FIX (mend, repair)


-- ==============================================================


SYNTAX fix = fix (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

SYNONYMS mend, repair = fix.


ADD TO EVERY OBJECT
  VERB fix
    CHECK my_game CAN fix
      ELSE SAY restricted_response OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS broken
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_broken_sg OF my_game.
          ELSE SAY check_obj_broken_pl OF my_game.
        END IF.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "Please be more specific. How do you intend to fix it?"
  END VERB fix.
END ADD TO.




-- ==============================================================


----- FOLLOW


-- ==============================================================


SYNTAX follow = follow (act)!
  WHERE act ISA ACTOR
    ELSE
      IF act IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY THING
  VERB follow
    CHECK my_game CAN follow
      ELSE SAY restricted_response OF my_game.
    AND act <> hero
      ELSE SAY check_obj_not_hero1 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND act NOT AT hero
      ELSE
        IF act IS NOT plural
          THEN SAY check_obj_not_at_hero_sg OF my_game.
          ELSE SAY check_obj_not_at_hero_pl OF my_game.
        END IF.
    AND hero IS NOT sitting
      ELSE SAY check_hero_not_sitting2 OF my_game.
    AND hero IS NOT lying_down
      ELSE SAY check_hero_not_lying_down2 OF my_game.
    AND act NEAR hero
      ELSE SAY check_act_near_hero OF my_game.

    DOES
      LOCATE hero AT act.
      "You follow" SAY THE act. "."
  END VERB follow.
END ADD TO.



-- ==============================================================


----- FREE (+ release)


-- ==============================================================


SYNTAX free = free (obj)
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

SYNONYMS release = free.


ADD TO EVERY THING
  VERB free
    CHECK my_game CAN free
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND obj <> hero
      ELSE SAY check_obj_not_hero5 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      IF obj IS NOT plural
        THEN "That doesn't need to be $vd."
        ELSE "Those don't need to be $vd."
      END IF.
  END VERB free.
END ADD TO.




-- ==============================================================


------ GET OFF


-- ==============================================================


SYNTAX get_off = get off (surface)
  WHERE surface ISA SUPPORTER
    ELSE
      IF surface IS NOT plural
        THEN SAY illegal_parameter_off_sg OF my_game.
        ELSE SAY illegal_parameter_off_pl OF my_game.
      END IF.

ADD TO EVERY SUPPORTER
  VERB get_off
    CHECK my_game CAN get_off
      ELSE SAY restricted_response OF my_game.

    DOES
      IF hero IS sitting OR hero IS lying_down
        THEN "You get off" SAY THE surface. "."
          MAKE hero NOT lying_down.
          MAKE hero NOT sitting.
        ELSE "You're standing up already."
      END IF.
    END VERB get_off.
END ADD TO.


-- ==============================================================


------ GET UP


-- ==============================================================


SYNTAX get_up = get up.


VERB get_up
  CHECK my_game CAN get_up
    ELSE SAY restricted_response OF my_game.

  DOES
    IF hero IS sitting
      THEN "You stand up."
        MAKE hero NOT sitting.
        MAKE hero NOT lying_down.
      ELSIF hero IS lying_down
        THEN "You get up."
          MAKE hero NOT lying_down.
          MAKE hero NOT sitting.
      ELSE "You're standing up already."
    END IF.
END VERB get_up.



-- ==============================================================


----- GIVE (+ hand, offer)


-- ==============================================================


SYNTAX give = 'give' (obj) 'to' (recipient)
  WHERE obj ISA OBJECT
    ELSE SAY illegal_parameter_obj OF my_game.
  AND recipient ISA ACTOR
    ELSE
      IF recipient IS NOT plural
        THEN SAY illegal_parameter2_to_sg OF my_game.
        ELSE SAY illegal_parameter2_to_pl OF my_game.
      END IF.


SYNONYMS hand, offer = give.


ADD TO EVERY OBJECT
  VERB give
    WHEN obj
      CHECK my_game CAN give
        ELSE SAY restricted_response OF my_game.
      AND obj IS takeable
        ELSE SAY check_obj_takeable OF my_game.
      AND obj <> recipient
        ELSE SAY check_obj_not_obj2_to OF my_game.
      AND recipient <> hero
        ELSE SAY check_obj2_not_hero3 OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj NOT IN recipient
        ELSE
          IF recipient IS NOT plural
            THEN SAY check_obj_not_in_act_sg OF my_game.
            ELSE SAY check_obj_not_in_act_pl OF my_game.
          END IF.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND recipient IS reachable AND recipient IS NOT distant
        ELSE
          IF recipient IS NOT reachable
            THEN
              IF recipient IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF recipient IS distant
            THEN
              IF recipient IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.

      DOES
        -- >>> implicit take >>>
        IF obj NOT DIRECTLY IN hero
          THEN SAY implicit_taking_message OF my_game.
               LOCATE obj IN hero.
        END IF.
        -- <<< implicit take <<<

        LOCATE obj IN recipient.
        "You give" SAY THE obj. "to" SAY THE recipient. "."
        MAKE obj NOT worn. -- for non-clothing wearables.

  END VERB give.
END ADD TO.




-- ==============================================================


----- GO TO


-- ==============================================================


SYNTAX go_to = 'to' (dest)!
  -- Because 'go' is predefined in the parser, it can't be used in verb definitions.
  -- The player will still be able to type 'go to [dest]' successfully.
  WHERE dest ISA THING
    ELSE SAY illegal_parameter_go OF my_game.

SYNONYMS walk = go.
  -- here we define a synonym for the predefined parser word 'go'
  -- which is not visible in the syntax itself.
  -- Thus, you will be able to say for example both 'go to shop' and 'walk to shop'
  -- (as well as for example both 'go east' and 'walk east').


ADD TO EVERY THING
  VERB go_to
    CHECK my_game CAN go_to
      ELSE SAY restricted_response OF my_game.
    AND dest <> hero
      ELSE SAY check_obj_not_hero4 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND hero IS NOT sitting
      ELSE SAY check_hero_not_sitting3 OF my_game.
    AND hero IS NOT lying_down
      ELSE SAY check_hero_not_lying_down3 OF my_game.
    AND dest NOT AT hero
      ELSE
        IF dest IS NOT plural
          THEN SAY check_obj_not_at_hero_sg OF my_game.
          ELSE SAY check_obj_not_at_hero_pl OF my_game.
        END IF.
    AND dest IS reachable AND dest IS NOT distant
      ELSE
        IF dest IS NOT reachable
          THEN
            IF dest IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF dest IS distant
          THEN
            IF dest IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "You can't see" SAY THE dest. "anywhere nearby. You must state a
      direction where you want to go."
  END VERB go_to.
END ADD TO.





-- ==============================================================


----- INVENTORY (+ i, inv)


-- ==============================================================



SYNTAX i = i.

SYNONYMS inv, inventory  = i.


VERB i
  CHECK my_game CAN i
    ELSE SAY restricted_response OF my_game.

  DOES
    -- ------------------
    -- List carried items
    -- ------------------
    SET my_game:temp_cnt TO COUNT IsA object, IS NOT worn, DIRECTLY IN hero.
    IF  my_game:temp_cnt = 0
      THEN "You are empty-handed."
      ELSE
        "You are carrying"
        FOR EACH carried_item IsA object, IS NOT worn, DIRECTLY IN hero
          DO
            SAY AN carried_item.
            DECREASE my_game:temp_cnt.
            DEPENDING ON my_game:temp_cnt
              = 1 THEN "and"
              = 0 THEN "."
              ELSE ","
            END DEPEND.
        END FOR.
    END IF.
    -- ------------------------
    -- List worn clothing items
    -- ------------------------
    -- Don't say anything if the Hero is not wearing anything.
    SET my_game:temp_cnt TO COUNT IsA clothing, DIRECTLY IN hero, IS worn.
    IF  my_game:temp_cnt <> 0
      THEN
        SAY my_game:hero_worn_header. --> "You are wearing"
        FOR EACH worn_item IsA clothing, DIRECTLY IN hero, IS worn
          DO
            SAY AN worn_item.
            DECREASE my_game:temp_cnt.
            DEPENDING ON my_game:temp_cnt
              = 1 THEN "and"
              = 0 THEN "."
              ELSE ","
            END DEPEND.
        END FOR.
    END IF.
END VERB i.




-- ==============================================================


----- JUMP


-- ==============================================================


SYNTAX jump = jump.


VERB jump
  CHECK my_game CAN jump
    ELSE SAY restricted_response OF my_game.
  AND hero IS NOT sitting
    ELSE SAY check_hero_not_sitting1 OF my_game.
  AND hero IS NOT lying_down
    ELSE SAY check_hero_not_lying_down1 OF my_game.

  DOES
    "You jump on the spot, to no avail."
END VERB jump.



-- ==============================================================


----- JUMP IN


-- ==============================================================


SYNTAX jump_in = jump 'in' (cont)
  WHERE cont ISA OBJECT
    ELSE
      IF cont IS NOT plural
        THEN SAY illegal_parameter_in_sg OF my_game.
        ELSE SAY illegal_parameter_in_pl OF my_game.
      END IF.
  AND cont ISA CONTAINER
    ELSE
      IF cont IS NOT plural
        THEN SAY illegal_parameter_in_sg OF my_game.
        ELSE SAY illegal_parameter_in_pl OF my_game.
      END IF.



ADD TO EVERY OBJECT
  VERB jump_in
    CHECK my_game CAN jump_in
      ELSE SAY restricted_response OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND cont IS reachable AND cont IS NOT distant
      ELSE
        IF cont IS NOT reachable
          THEN
            IF cont IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF cont IS distant
          THEN
            IF cont IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.
    AND hero IS NOT sitting
      ELSE SAY check_hero_not_sitting1 OF my_game.
    AND hero IS NOT lying_down
      ELSE SAY check_hero_not_lying_down1 OF my_game.

    DOES
      IF cont IS NOT plural
        THEN "That's not something you can jump into."
        ELSE "Those are not something you can jump into."
      END IF.

  END VERB jump_in.
END ADD TO.



-- ==============================================================


----- JUMP ON


-- ==============================================================


SYNTAX jump_on = jump 'on' (surface)
  WHERE surface ISA SUPPORTER
    ELSE
      IF surface IS NOT plural
        THEN SAY illegal_parameter_on_sg OF my_game.
        ELSE SAY illegal_parameter_on_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB jump_on
    CHECK my_game CAN jump_on
      ELSE SAY restricted_response OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND hero IS NOT sitting
      ELSE SAY check_hero_not_sitting1 OF my_game.
    AND hero IS NOT lying_down
      ELSE SAY check_hero_not_lying_down1 OF my_game.

    DOES
      IF surface IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "something you can jump onto."

  END VERB jump_on.
END ADD TO.



-- =============================================================


----- KICK


-- =============================================================


SYNTAX kick = kick (target)
  WHERE target ISA THING
    ELSE
      IF target IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY THING
  VERB kick
    CHECK my_game CAN kick
      ELSE SAY restricted_response OF my_game.
    AND target IS examinable
      ELSE
        IF target IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND target <> hero
      ELSE SAY check_obj_not_hero1 OF my_game.
    AND target NOT IN hero
      ELSE
        IF target IS NOT worn
          THEN SAY my_game:check_obj_not_in_hero1.
          ELSE SAY my_game:check_obj_not_in_worn2.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND target IS reachable AND target IS NOT distant
      ELSE
        IF target IS NOT reachable
          THEN
            IF target IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF target IS distant
          THEN
            IF target IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES "Resorting to brute force is not the solution here."

  END VERB kick.
END ADD TO.



-- ==============================================================


-- KILL (+ murder)


-- ==============================================================


SYNTAX kill = kill (victim)
  WHERE victim ISA ACTOR
    ELSE
      IF victim IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY ACTOR
  VERB kill
    CHECK my_game CAN kill
      ELSE SAY restricted_response OF my_game.
    AND victim IS examinable
      ELSE
        IF victim IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND victim <> hero
      ELSE SAY check_obj_not_hero2 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.

    DOES "You have to state what you want to kill" SAY THE victim. "with."

  END VERB kill.
END ADD TO.



-- ==============================================================


-- KILL WITH


-- ==============================================================


SYNTAX kill_with = kill (victim) 'with' (weapon)
  WHERE victim ISA ACTOR
    ELSE
      IF victim IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND weapon ISA WEAPON
    ELSE
      IF weapon IS NOT plural
        THEN SAY illegal_parameter_with_sg OF my_game.
        ELSE SAY illegal_parameter_with_pl OF my_game.
      END IF.


ADD TO EVERY ACTOR
  VERB kill_with
    WHEN victim
      CHECK my_game CAN kill_with
        ELSE SAY restricted_response OF my_game.
      AND victim <> hero
        ELSE SAY check_obj_not_hero2 OF my_game.
      AND weapon IN hero
        ELSE SAY check_obj2_in_hero OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND victim IS NOT distant
        ELSE
          IF victim IS NOT plural
            THEN SAY check_obj_not_distant_sg OF my_game.
            ELSE SAY check_obj_not_distant_pl OF my_game.
          END IF.

      DOES
        "That would be needlessly brutal."

  END VERB kill_with.
END ADD TO.



-- ==============================================================


----- KISS (+ hug, embrace)


-- ==============================================================


SYNTAX kiss = kiss (obj)
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

SYNONYMS hug, embrace = kiss.


ADD TO EVERY THING
  VERB kiss
    CHECK my_game CAN kiss
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND obj <> hero
      ELSE SAY check_obj_not_hero6 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      IF obj ISA ACTOR
        THEN SAY THE obj. "avoids your advances."
        ELSE "Nothing would be achieved by that."
      END IF.

  END VERB kiss.
END ADD TO.




-- ==============================================================


----- KNOCK


-- ==============================================================


SYNTAX knock = knock 'on' (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_on_sg OF my_game.
        ELSE SAY illegal_parameter_on_pl OF my_game.
      END IF.

       knock = knock (obj).


ADD TO EVERY OBJECT
  VERB knock
    CHECK my_game CAN knock
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_on_sg OF my_game.
          ELSE SAY check_obj_suitable_on_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "You knock on" SAY THE obj. "$$. Nothing happens."

  END VERB knock.
END ADD TO.


--- another 'knock' formulation added to guide players to use the right phrasing:


SYNTAX knock_error = knock.


VERB knock_error
  DOES
    "Please use the formulation KNOCK ON SOMETHING to knock on something."
END VERB knock_error.



-- ==============================================================


----- LIE DOWN


-- ==============================================================


SYNTAX lie_down = lie 'down'.

    lie_down = lie.


VERB lie_down
  CHECK my_game CAN lie_down
    ELSE SAY restricted_response OF my_game.
  AND hero IS NOT lying_down
    ELSE SAY check_hero_not_lying_down4 OF my_game.

  DOES
    "There's no need to lie down right now."
    -- If you need this to work, insert the following lines instead of the above:
        -- DOES "You lie down."
        -- MAKE hero lying_down.
        -- MAKE hero NOT sitting_down.
END VERB lie_down.


-- When the hero is sitting or lying down, it will be impossible for her/him to
-- perform certain actions, as numerous verbs in the library have checks for this.
-- For example, if the hero is lying down and the player types 'attack [something]',
-- the response will be "It will be difficult to attack anything while
-- lying down."

-- Also, it is often essential to make certain objects NOT reachable when you are sitting
-- or lying down.



-- ==============================================================


----- LIE IN


-- ==============================================================


SYNTAX lie_in = lie 'in' (cont)
  WHERE cont ISA OBJECT
    ELSE
      IF cont IS NOT plural
        THEN SAY illegal_parameter_in_sg OF my_game.
        ELSE SAY illegal_parameter_in_pl OF my_game.
      END IF.
  AND cont ISA CONTAINER
    ELSE
      IF cont IS NOT plural
        THEN SAY illegal_parameter_in_sg OF my_game.
        ELSE SAY illegal_parameter_in_pl OF my_game.
      END IF.

       lie_in = lie 'down' 'in' (cont).


ADD TO EVERY OBJECT
  VERB lie_in
    CHECK my_game CAN lie_in
      ELSE SAY restricted_response OF my_game.
    AND hero IS NOT lying_down
      ELSE SAY check_hero_not_lying_down4 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND cont IS reachable AND cont IS NOT distant
      ELSE
        IF cont IS NOT reachable
          THEN
            IF cont IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF cont IS distant
          THEN
            IF cont IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "There's no need to lie down in" SAY THE cont. "."
      -- If you need this to work, make a nested location
      -- (for example THE in_bed ISA LOCATION AT bedroom; etc.)
      -- Remember to: MAKE hero lying_down.
      -- Presently, an actor cannot be located inside a container object.

  END VERB lie_in.
END ADD TO.


-- When the hero is sitting or lying down, it will be impossible for her/him to
-- perform certain actions, as numerous verbs in the library have checks for this.
-- For example, if the hero is lying down and the player types 'attack [something]',
-- the response will be "It will be difficult to attack anything while
-- lying down."

-- Also, it is often essential to make certain objects NOT reachable when you are sitting
-- or lying down.



-- ==============================================================


----- LIE ON


-- ==============================================================


SYNTAX lie_on = lie 'on' (surface)
  WHERE surface ISA SUPPORTER
    ELSE
      IF surface IS NOT plural
        THEN SAY illegal_parameter_on_sg OF my_game.
        ELSE SAY illegal_parameter_on_pl OF my_game.
      END IF.

       lie_on = lie 'down' 'on' (surface).


ADD TO EVERY OBJECT
  VERB lie_on
    CHECK my_game CAN lie_on
      ELSE SAY restricted_response OF my_game.
    AND hero IS NOT lying_down
      ELSE SAY check_hero_not_lying_down4 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND surface IS reachable AND surface IS NOT distant
      ELSE
        IF surface IS NOT reachable
          THEN
            IF surface IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF surface IS distant
          THEN
            IF surface IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "There's no need to lie down on" SAY THE surface. "."
      -- If you need this to work, make a nested location
      -- (for example THE on_bed ISA LOCATION AT bedroom; etc.)
      -- Remember to: MAKE hero lying_down.
                -- Presently, an actor cannot be located inside a container object
      -- or on a supporter.

  END VERB lie_on.
END ADD TO.



-- When the hero is sitting or lying down, it will be impossible for her/him to
-- perform certain actions, as numerous verbs in the library have checks for this.
-- For example, if the hero is lying down and the player types 'attack [something]',
-- the response will be "It will be difficult to attack anything while
-- lying down."

-- Also, it is often essential to make certain objects NOT reachable when you are sitting
-- or lying down.



-- ==============================================================


----- LIFT


-- ==============================================================


SYNTAX lift = lift (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

SYNONYMS raise = lift.


ADD TO EVERY OBJECT
  VERB lift
    CHECK my_game CAN lift
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj NOT IN hero
      ELSE SAY check_obj_not_in_hero1 OF my_game.
    AND obj IS movable
      ELSE SAY check_obj_movable OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.
    AND weight OF obj < 50
      ELSE
        IF obj IS NOT PLURAL
          THEN SAY check_obj_weight_sg OF my_game.
          ELSE SAY check_obj_weight_pl OF my_game.
        END IF.

    DOES
      "That wouldn't accomplish anything."

  END VERB lift.
END ADD TO.



-- ==============================================================


----- LIGHT (+ lit)


-- ==============================================================


SYNTAX light = light (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

SYNONYMS lit = light.


ADD TO EVERY OBJECT
  VERB light
    CHECK my_game CAN light
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      IF obj IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "something you can $v."

  END VERB light.
END ADD TO.




-- ==============================================================


----- LISTEN


-- ==============================================================


SYNTAX listen0 = listen.


VERB listen0
  CHECK my_game CAN listen0
    ELSE SAY restricted_response OF my_game.
  DOES
    "You hear nothing unusual."
END VERB listen0.



-- ==============================================================


----- LISTEN TO


-- ==============================================================


SYNTAX listen = listen 'to' (obj)!
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_to_sg OF my_game.
        ELSE SAY illegal_parameter_to_pl OF my_game.
      END IF.


ADD TO EVERY THING
  VERB listen
    CHECK my_game CAN listen
      ELSE SAY restricted_response OF my_game.
    AND obj <> hero
      ELSE SAY check_obj_not_hero1 OF my_game.

    DOES
      IF hero AT obj
        THEN
          IF obj ISA ACTOR
            THEN SAY THE obj.
              IF obj IS NOT PLURAL
                THEN "is"
                ELSE "are"
              END IF.
              "not talking right now."
            ELSE "You hear nothing unusual."
          END IF.
      ELSIF obj NEAR hero
        THEN "You can't hear" SAY THE obj. "very well from here."
      END IF.

  END VERB listen.
END ADD TO.



-- ==============================================================


----- LOCK


-- ==============================================================


SYNTAX lock = lock (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB lock
    CHECK my_game CAN lock
      ELSE SAY restricted_response OF my_game.
    AND obj IS lockable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.
    AND obj IS NOT locked
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_not_locked_sg OF my_game.
          ELSE SAY check_obj_not_locked_pl OF my_game.
      END IF.

    DOES
      IF matching_key OF obj IN hero
        THEN MAKE obj locked.
          "(with" SAY THE matching_key OF obj. "$$)$n"
          "You"

          IF obj IS open
            THEN "close and"
              MAKE obj NOT open.
          END IF.

          "lock" SAY THE obj. "."
            ELSE  "You have to state what you want to lock" SAY THE obj. "with."
      END IF.

  END VERB lock.
END ADD TO.



-- ==============================================================


----- LOCK WITH


-- ==============================================================


SYNTAX lock_with = lock (obj) 'with' (key)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND key ISA OBJECT
    ELSE
      IF key IS NOT plural
        THEN SAY illegal_parameter2_with_sg OF my_game.
        ELSE SAY illegal_parameter2_with_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB lock_with
    WHEN obj
      CHECK my_game CAN lock_with
        ELSE SAY restricted_response OF my_game.
      AND obj IS lockable
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND key IS examinable
        ELSE
          IF key IS NOT plural
            THEN SAY check_obj2_suitable_with_sg OF my_game.
            ELSE SAY check_obj2_suitable_with_pl OF my_game.
          END IF.
      AND obj <> key
        ELSE SAY check_obj_not_obj2_with OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj IS NOT locked
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_not_locked_sg OF my_game.
            ELSE SAY check_obj_not_locked_pl OF my_game.
          END IF.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND key IN hero
        ELSE SAY check_obj2_in_hero OF my_game.
      AND key = matching_key OF obj
        ELSE SAY check_door_matching_key OF my_game.

      DOES
        MAKE obj locked. "You"
        IF obj IS open
          THEN "close and"
            MAKE obj NOT open.
        END IF.
        "lock" SAY THE obj. "with" SAY THE key. "."

  END VERB lock_with.
END ADD TO.



-- ==============================================================


----- LOOK


-- ==============================================================


SYNTAX 'look' = 'look'.

SYNONYMS l = 'look'.


VERB 'look'
  CHECK my_game CAN 'look'
    ELSE SAY restricted_response OF my_game.
  DOES
    INCREASE described OF CURRENT LOCATION.
    -- see 'locations.i', attribute 'described'.
    LOOK.
END VERB 'look'.




-- ==============================================================


----- LOOK AT -> see EXAMINE


-- ==============================================================





-- ==============================================================


----- LOOK BEHIND


-- ==============================================================


SYNTAX look_behind = 'look' behind (bulk)
  WHERE bulk ISA THING
    ELSE SAY illegal_parameter_there OF my_game.


ADD TO EVERY THING
  VERB look_behind
    CHECK my_game CAN look_behind
      ELSE SAY restricted_response OF my_game.
    AND bulk IS examinable
      ELSE SAY check_obj_suitable_there OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND bulk <> hero
      ELSE SAY check_obj_not_hero7 OF my_game.

    DOES
      IF bulk IN hero
        THEN "You turn" SAY THE bulk. "in your hands but notice nothing unusual about it."
        ELSE "You notice nothing unusual behind" SAY THE bulk. "."
      END IF.

  END VERB look_behind.
END ADD TO.



-- ==============================================================


----- LOOK IN


-- ==============================================================


SYNTAX
  look_in = 'look' 'in' (cont)
    WHERE cont ISA OBJECT
      ELSE SAY illegal_parameter_there OF my_game.
    AND cont ISA CONTAINER
      ELSE SAY illegal_parameter_there OF my_game.


ADD TO EVERY OBJECT
  VERB look_in
    CHECK my_game CAN look_in
      ELSE SAY restricted_response OF my_game.
    AND cont IS examinable
      ELSE SAY check_obj_suitable_there OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND cont IS open
      ELSE
        IF cont IS NOT plural
          THEN SAY check_obj_open2_sg OF my_game.
          ELSE SAY check_obj_open2_pl OF my_game.
        END IF.

    DOES
      LIST cont.

  END VERB look_in.
END ADD TO.



-- ==============================================================


----- LOOK OUT OF


-- ==============================================================


SYNTAX look_out_of = 'look' 'out' 'of' (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_look_out_sg OF my_game.
        ELSE SAY illegal_parameter_look_out_pl OF my_game.
      END IF.



ADD TO EVERY OBJECT
  VERB look_out_of
    CHECK my_game CAN look_out_of
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_look_out_sg OF my_game.
          ELSE SAY check_obj_suitable_look_out_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.

    DOES
      IF obj IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "something you can look out of."

  END VERB look_out_of.
END ADD TO.



-- ==============================================================


----- LOOK THROUGH


-- ==============================================================


SYNTAX look_through = 'look' through (bulk)
  WHERE bulk ISA OBJECT
    ELSE SAY illegal_parameter_look_through OF my_game.



ADD TO EVERY OBJECT
  VERB look_through
    CHECK my_game CAN look_through
      ELSE SAY restricted_response OF my_game.
    AND bulk IS examinable
      ELSE SAY check_obj_suitable_look_through OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.

    DOES
      "You can't see through" SAY THE bulk. "."

  END VERB look_through.
END ADD TO.



-- ==============================================================


----- LOOK UNDER


-- ==============================================================


SYNTAX look_under = 'look' under (bulk)
  WHERE bulk ISA THING
    ELSE SAY illegal_parameter_there OF my_game.



ADD TO EVERY THING
  VERB look_under
    CHECK my_game CAN look_under
      ELSE SAY restricted_response OF my_game.
    AND bulk IS examinable
      ELSE SAY check_obj_suitable_there OF my_game.
    AND bulk <> hero
      ELSE SAY check_obj_not_hero8 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.

    DOES
      "You notice nothing unusual under" SAY THE bulk. "."

  END VERB look_under.
END ADD TO.



-- ==============================================================


----- LOOK UP   (-> see also CONSULT)


-- ==============================================================


SYNTAX look_up = 'look' up.


VERB look_up
  CHECK my_game CAN look_up
    ELSE SAY restricted_response OF my_game.
  DOES "Looking up, you see nothing unusual."
END VERB look_up.





-- ==============================================================


----- OPEN


-- ==============================================================


SYNTAX open = open (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB open
    CHECK my_game CAN open
      ELSE SAY restricted_response OF my_game.
    AND obj IS openable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.
    AND obj IS NOT open
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_not_open_sg OF my_game.
          ELSE SAY check_obj_not_open_pl OF my_game.
        END IF.

    DOES
      IF obj IS locked
        THEN
          IF matching_key OF obj IN hero
            THEN MAKE obj NOT locked.
              MAKE obj open.
              "(with" SAY THE matching_key OF obj. "$$)
              $nYou unlock and open" SAY THE obj. "."
            ELSE SAY THE obj. "appears to be locked."
          END IF.
      ELSIF obj IS NOT locked
        THEN MAKE obj open.
        "You open" SAY THE obj. "."
      END IF.

  END VERB open.
END ADD TO.



-- ==============================================================


----- OPEN WITH


-- ==============================================================


SYNTAX open_with = open (obj) 'with' (instr)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND instr ISA OBJECT
    ELSE
      IF instr IS NOT plural
        THEN SAY illegal_parameter2_with_sg OF my_game.
        ELSE SAY illegal_parameter2_with_pl OF my_game.
      END IF.



ADD TO EVERY OBJECT
  VERB open_with
    WHEN obj
      CHECK my_game CAN open_with
        ELSE SAY restricted_response OF my_game.
      AND obj IS openable
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND instr IS examinable
        ELSE
          IF instr IS NOT plural
            THEN SAY check_obj2_suitable_with_sg OF my_game.
            ELSE SAY check_obj2_suitable_with_pl OF my_game.
          END IF.
      AND obj <> instr
        ELSE SAY check_obj_not_obj2_with OF my_game.
          AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND instr IN hero
        ELSE SAY check_obj2_in_hero OF my_game.
      AND obj IS NOT open
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_not_open_sg OF my_game.
            ELSE SAY check_obj_not_open_pl OF my_game.
          END IF.

      DOES
        IF obj IS locked
          THEN
            IF instr = matching_key OF obj
              THEN MAKE obj NOT locked.
                MAKE obj open.
                "You unlock  and open" SAY THE obj.
                "with" SAY THE instr. "."
              ELSE SAY THE obj.
                IF obj IS NOT plural
                  THEN "is locked."
                  ELSE "are locked."
                END IF.
            END IF.
          ELSE "You can't open" SAY THE obj. "with" SAY THE instr. "."
        END IF.

  END VERB open_with.
END ADD TO.



-- ==============================================================


----- PLAY


-- ==============================================================


SYNTAX 'play' = 'play' (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB 'play'
    CHECK my_game CAN 'play'
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_with_sg OF my_game.
          ELSE SAY check_obj_suitable_with_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      IF obj IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "something you can play."

  END VERB 'play'.
END ADD TO.



-- ==============================================================


----- PLAY WITH


-- ==============================================================


SYNTAX play_with = 'play' 'with' (obj)
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_with_sg OF my_game.
        ELSE SAY illegal_parameter_with_pl OF my_game.
      END IF.



ADD TO EVERY THING
  VERB play_with
    CHECK my_game CAN play_with
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_with_sg OF my_game.
          ELSE SAY check_obj_suitable_with_pl OF my_game.
        END IF.
    AND obj <> hero
      ELSE SAY check_obj_not_hero6 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "After second thought you don't find it purposeful to start
       playing with" SAY THE obj. "."

  END VERB play_with.
END ADD TO.



-- ==============================================================


----- POUR, POUR IN, POUR ON


-- ==============================================================



-- => SEE EMPTY, EMPTY IN, EMPTY ON




-- ==============================================================


----- PRAY


-- ==============================================================


SYNTAX pray = pray.


VERB pray
  CHECK my_game CAN pray
    ELSE SAY restricted_response OF my_game.
  DOES "Your prayers don't seem to help right now."
END VERB pray.



-- ==============================================================


----- PRY


-- ==============================================================


SYNTAX pry = pry (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB pry
    CHECK my_game CAN pry
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.

    DOES "You must state what you want to pry" SAY THE obj. "with."

  END VERB pry.
END ADD TO.



-- ==============================================================


----- PRY_WITH


-- ==============================================================


SYNTAX pry_with = pry (obj) 'with' (instr)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND instr ISA OBJECT
    ELSE
      IF instr IS NOT plural
        THEN SAY illegal_parameter2_with_sg OF my_game.
        ELSE SAY illegal_parameter2_with_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB pry_with
    WHEN obj
      CHECK my_game CAN pry_with
        ELSE SAY restricted_response OF my_game.
      AND obj IS examinable
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND instr IS examinable
        ELSE
          IF instr IS NOT plural
            THEN SAY check_obj2_suitable_with_sg OF my_game.
            ELSE SAY check_obj2_suitable_with_pl OF my_game.
          END IF.
      AND obj <> instr
        ELSE SAY check_obj_not_obj2_with OF my_game.
      AND instr IN hero
        ELSE SAY check_obj2_in_hero OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.

    DOES "That doesn't work."

  END VERB pry_with.
END ADD TO.



-- ==============================================================


----- PULL


-- ==============================================================


SYNTAX pull = pull (obj)
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB pull
    CHECK my_game CAN pull
      ELSE SAY restricted_response OF my_game.
    AND obj IS movable
      ELSE SAY check_obj_movable OF my_game.
    AND obj <> hero
      ELSE SAY check_obj_not_hero1 OF my_game.
    AND obj IS inanimate
      ELSE SAY check_obj_inanimate1 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.
 
    DOES
      "That wouldn't accomplish anything."

  END VERB pull.
END ADD TO.



-- ==============================================================


----- PUSH


-- ==============================================================


SYNTAX push = push (obj)
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

SYNONYMS press = push.


ADD TO EVERY THING
  VERB push
    CHECK my_game CAN push
      ELSE SAY restricted_response OF my_game.
    AND obj IS movable
          ELSE SAY check_obj_movable OF my_game.
    AND obj <> hero
      ELSE SAY check_obj_not_hero1 OF my_game.
    AND obj IS inanimate
      ELSE SAY check_obj_inanimate1 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "You give" SAY THE obj. "a little push. Nothing happens."

  END VERB push.
END ADD TO.




-- ==============================================================


----- PUSH WITH


-- ==============================================================


SYNTAX push_with = push (obj) 'with' (instr)
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND instr ISA OBJECT
    ELSE SAY illegal_parameter2_with_sg OF my_game.


ADD TO EVERY THING
  VERB push_with
    WHEN obj
      CHECK my_game CAN push_with
        ELSE SAY restricted_response OF my_game.
      AND obj IS movable
        ELSE SAY check_obj_movable OF my_game.
      AND obj <> instr
        ELSE SAY check_obj_not_obj2_with OF my_game.
      AND instr IS examinable
        ELSE
          IF instr IS NOT plural
            THEN SAY check_obj2_suitable_with_sg OF my_game.
            ELSE SAY check_obj2_suitable_with_pl OF my_game.
          END IF.
      AND instr IN hero
        ELSE SAY check_obj2_in_hero OF my_game.
      AND obj <> hero
        ELSE SAY check_obj_not_hero1 OF my_game.
      AND obj IS inanimate
        ELSE SAY check_obj_inanimate1 OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.

      DOES
        "That wouldn't accomplish anything."

  END VERB push_with.
END ADD TO.



-- ==============================================================


----- PUT (+ lay, locate, place)


-- ==============================================================


SYNTAX put = put (obj)
  WHERE obj ISA OBJECT
    ELSE SAY illegal_parameter_obj OF my_game.


SYNONYMS lay, place = put.


ADD TO EVERY OBJECT
  VERB put
    CHECK my_game CAN put
      ELSE SAY restricted_response OF my_game.
    AND obj IN HERO
      ELSE SAY check_obj_in_hero OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.

    DOES
      "You must state where you want to put"
      IF obj IS NOT plural
        THEN "it."
        ELSE "them."
      END IF.

  END VERB put.
END ADD TO.




-- ==============================================================


----- PUT DOWN  (works as  'drop')


-- ==============================================================


----- The syntax for 'put down' has been declared in the 'drop' verb.




-- ==============================================================


----- PUT IN  (+ insert)


-- ==============================================================


SYNTAX put_in = put (obj) 'in' (cont)
  WHERE obj ISA OBJECT
    ELSE SAY illegal_parameter_obj OF my_game.
  AND cont ISA OBJECT
    ELSE
      IF cont ISA ACTOR
        THEN SAY illegal_parameter_act OF my_game.
        ELSE SAY illegal_parameter2_there OF my_game.
      END IF.
  AND cont ISA CONTAINER
    ELSE SAY illegal_parameter2_there OF my_game.


  put_in = insert (obj) 'in' (cont).


ADD TO EVERY OBJECT
  VERB put_in
    WHEN obj
      CHECK my_game CAN put_in
        ELSE SAY restricted_response OF my_game.
      AND obj <> cont
        ELSE SAY check_obj_not_obj2_in OF my_game.
      AND obj IS takeable
        ELSE SAY check_obj_takeable OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND obj NOT IN cont
        ELSE
          IF cont ISA SUPPORTER
            THEN SAY check_cont_not_supporter OF my_game.
            ELSE
              IF obj IS NOT plural
                THEN SAY check_obj_not_in_cont_sg OF my_game.
                ELSE SAY check_obj_not_in_cont_pl OF my_game.
              END IF.
          END IF.
      AND cont IS reachable AND cont IS NOT distant
        ELSE
          IF cont IS NOT reachable
            THEN
              IF cont IS NOT plural
                THEN SAY check_obj2_reachable_sg OF my_game.
                ELSE SAY check_obj2_reachable_pl OF my_game.
              END IF.
          ELSIF cont IS distant
            THEN
              IF cont IS NOT plural
                THEN SAY check_obj2_not_distant_sg OF my_game.
                ELSE SAY check_obj2_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND obj IN allowed OF cont
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_allowed_in_sg OF my_game.
            ELSE SAY check_obj_allowed_in_pl OF my_game.
          END IF.
      AND cont IS open
        ELSE
          IF cont IS NOT plural
            THEN SAY check_obj2_open_sg OF my_game.
            ELSE SAY check_obj2_open_pl OF my_game.
          END IF.

      DOES
        MAKE obj NOT worn. -- for non-clothing wearables.
        LOCATE obj IN cont.
        "You put" SAY THE obj. "into" SAY THE cont. "."

  END VERB put_in.
END ADD TO.




-- ==============================================================


----- PUT AGAINST, BEHIND, NEAR, UNDER


-- ==============================================================


SYNTAX put_against = put (obj) against (bulk)
  WHERE obj ISA OBJECT
    ELSE SAY illegal_parameter_obj OF my_game.
  AND bulk ISA THING
    ELSE SAY illegal_parameter2_there OF my_game.



SYNTAX put_behind = put (obj) behind (bulk)
  WHERE obj ISA OBJECT
    ELSE SAY illegal_parameter_obj OF my_game.
  AND bulk ISA THING
    ELSE SAY illegal_parameter2_there OF my_game.



SYNTAX put_near = put (obj) 'near' (bulk)
  WHERE obj ISA OBJECT
    ELSE SAY illegal_parameter_obj OF my_game.
  AND bulk ISA THING
    ELSE SAY illegal_parameter2_there OF my_game.



SYNTAX put_under = put (obj) under (bulk)
  WHERE obj ISA OBJECT
    ELSE SAY illegal_parameter_obj OF my_game.
  AND bulk ISA THING
    ELSE SAY illegal_parameter2_there OF my_game.



ADD TO EVERY OBJECT
  VERB put_against, put_behind, put_near, put_under
    WHEN obj
      CHECK my_game CAN put_against AND my_game CAN put_behind
      AND my_game CAN put_near AND my_game CAN put_under
        ELSE SAY restricted_response OF my_game.
      AND bulk NOT IN hero
        ELSE SAY check_obj2_not_in_hero2 OF my_game.
      AND obj <> bulk
        ELSE SAY check_obj_not_obj2_put OF my_game.
      AND obj IS takeable
        ELSE SAY check_obj_takeable OF my_game.
      AND bulk <> hero
        ELSE SAY check_obj2_not_hero2 OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND bulk IS reachable AND bulk IS NOT distant
        ELSE
          IF bulk IS NOT reachable
            THEN
              IF bulk IS NOT plural
                THEN SAY check_obj2_reachable_sg OF my_game.
                ELSE SAY check_obj2_reachable_pl OF my_game.
              END IF.
          ELSIF bulk IS distant
            THEN
              IF bulk IS NOT plural
                THEN SAY check_obj2_not_distant_sg OF my_game.
                ELSE SAY check_obj2_not_distant_pl OF my_game.
              END IF.
          END IF.

      DOES
        "That wouldn't accomplish anything."

  END VERB put_against.
END ADD TO.



-- ==============================================================


----- PUT_ON


-- ==============================================================


-- To use this verb in the meaning 'wear', see the file 'classes.i',
-- class 'clothing', verb 'wear'.

-- You can put things on the floor/ground (= drop them). In other
-- cases, the action will fail by default. Allow the action with
-- individual instances only.



SYNTAX put_on = put (obj) 'on' (surface)
  WHERE obj ISA OBJECT
    ELSE SAY illegal_parameter_obj OF my_game.
  AND surface ISA SUPPORTER
    ELSE SAY illegal_parameter2_there OF my_game.



ADD TO EVERY OBJECT
  VERB put_on
    WHEN obj
      CHECK my_game CAN put_on
        ELSE SAY restricted_response OF my_game.
      AND obj <> surface
        ELSE SAY check_obj_not_obj2_on OF my_game.
      AND obj IS takeable
        ELSE SAY check_obj_takeable OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj NOT IN surface
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_not_on_surface_sg OF my_game.
            ELSE SAY check_obj_not_on_surface_pl OF my_game.
          END IF.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND surface IS reachable AND surface IS NOT distant
        ELSE
          IF surface IS NOT reachable
            THEN
              IF surface IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF surface IS distant
            THEN
              IF surface IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.

      DOES
        -- >>> implicit take >>>
        IF obj NOT DIRECTLY IN hero
          THEN LOCATE obj IN hero.
               SAY implicit_taking_message OF my_game.
        END IF.
        -- <<< implicit take <<<

        IF surface = floor OR surface = ground
          THEN LOCATE obj AT hero.
          ELSE LOCATE obj IN surface.
        END IF.

        "You put" SAY THE obj. "on" SAY THE surface. "."
        MAKE obj NOT worn. -- for non-clothing wearables.

  END VERB put_on.
END ADD TO.



-- ==============================================================


----- PUT OUT  (works as -> EXTINGUISH)


-- ==============================================================


----- The syntax for 'put out' has been declared in the 'extinguish' verb.



-- ==============================================================


----- READ


-- ==============================================================


SYNTAX read = read (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB read
    CHECK my_game CAN read
      ELSE SAY restricted_response OF my_game.
    AND obj IS readable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS NOT distant
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_not_distant_sg OF my_game.
          ELSE SAY check_obj_not_distant_pl OF my_game.
        END IF.

    DOES
      IF text OF obj = ""
        THEN "There's nothing written on" SAY THE obj. "."
        ELSE "You read" SAY THE obj. "."

          IF obj IS NOT plural
            THEN "It says"
            ELSE "They say"
          END IF.

          """$$" SAY text OF obj. "$$""."
      END IF.

  END VERB read.
END ADD TO.



-- ==============================================================


-- REMOVE


-- ==============================================================

-- this verb only works with clothing (see 'classes.i').

SYNTAX remove = remove (obj)
    WHERE obj ISA OBJECT
      ELSE
        IF obj IS NOT plural
          THEN SAY illegal_parameter_sg OF my_game. "since you're not wearing it."
          ELSE SAY illegal_parameter_pl OF my_game. "since you're not wearing them."
        END IF.

       remove = take 'off' (obj).
       remove = take (obj) 'off'.
       remove = doff (obj).


ADD TO EVERY OBJECT
  VERB remove
    CHECK my_game CAN remove
      ELSE SAY restricted_response OF my_game.

    DOES
      IF obj IS NOT plural
        THEN "That's"
        ELSE "Those are"
      END IF.
      "not something you can remove since you're not wearing"
      IF obj IS NOT plural
        THEN "it."
        ELSE "them."
      END IF.

  END VERB remove.
END ADD TO.



-- ==============================================================


----- REMOVE FROM      ( => TAKE FROM)


-- ==============================================================


----- this verb works as 'take from'




-- ==============================================================


----- RUB (+ massage)


-- ==============================================================


SYNTAX rub = rub (obj)
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

SYNONYMS massage = rub.


ADD TO EVERY THING
  VERB rub
    CHECK my_game CAN rub
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND obj <> hero
      ELSE SAY check_obj_not_hero6 OF my_game.
    AND obj IS inanimate
      ELSE SAY check_obj_inanimate2 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "Nothing would be achieved by that."

  END VERB rub.
END ADD TO.




-- ==============================================================


----- SAY


-- ==============================================================


SYNTAX 'say' = 'say' (topic)
  WHERE topic ISA STRING
    ELSE SAY illegal_parameter_string OF my_game.


ADD TO EVERY STRING
  VERB 'say'
    CHECK my_game CAN 'say'
      ELSE SAY restricted_response OF my_game.

    DOES
      "Nothing happens."

  END VERB 'say'.
END ADD TO.




-- ==============================================================


----- SAY TO


-- ==============================================================


SYNTAX say_to = 'say' (topic) 'to' (act)
  WHERE topic ISA STRING
    ELSE SAY illegal_parameter_string OF my_game.
  AND act ISA ACTOR
    ELSE
      IF act IS NOT plural
        THEN SAY illegal_parameter_talk_sg OF my_game.
        ELSE SAY illegal_parameter_talk_pl OF my_game.
      END IF.


ADD TO EVERY ACTOR
  VERB say_to
    WHEN act
      CHECK my_game CAN say_to
        ELSE SAY restricted_response OF my_game.
      AND act <> hero
        ELSE SAY check_obj2_not_hero1 OF my_game.
      AND act CAN talk
        ELSE
          IF act IS NOT plural
            THEN SAY check_act_can_talk_sg OF my_game.
            ELSE SAY check_act_can_talk_pl OF my_game.
          END IF.
      AND act IS NOT distant
        ELSE
          IF act IS NOT plural
            THEN SAY check_obj_not_distant_sg OF my_game.
            ELSE SAY check_obj_not_distant_pl OF my_game.
          END IF.

    DOES
      SAY THE act.
      IF act IS NOT plural
        THEN "doesn't look"
        ELSE "don't look"
      END IF.
      "interested."

  END VERB say_to.
END ADD TO.



-- ==============================================================


----- SCORE


-- ==============================================================


SYNTAX 'score' = 'score'.


META VERB 'score'
  CHECK my_game CAN 'score'
    ELSE SAY restricted_response OF my_game.
  DOES
    SCORE.
    -- (or, if you wish to disable the score, use the following kind of
      -- line instead of the above:
    -- "There is no score in this game.")
END VERB 'score'.



-- ==============================================================


----- SCRATCH


-- ==============================================================


SYNTAX scratch = scratch (obj)
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY THING
  VERB scratch
    CHECK my_game CAN scratch
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND obj <> hero
      ELSE SAY check_obj_not_hero3 OF my_game.
    AND obj IS inanimate
      ELSE SAY check_obj_inanimate1 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "Nothing would be achieved by that."

  END VERB scratch.
END ADD TO.




-- ==============================================================


------ SEARCH


-- ==============================================================


SYNTAX search = search (obj)
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY THING
  VERB search
    CHECK my_game CAN search
      ELSE SAY restricted_response OF my_game.
    AND obj <> hero
      ELSE LIST hero.
    AND obj IS inanimate
      ELSE SAY check_obj_inanimate1 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "You find nothing of interest."

  END VERB search.
END ADD TO.



-- ==============================================================


----- SELL


-- ==============================================================


SYNTAX sell = sell (item)
  WHERE item ISA OBJECT
    ELSE
      IF item IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB sell
    CHECK my_game CAN sell
      ELSE SAY restricted_response OF my_game.
    AND item IS examinable
      ELSE
        IF item IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.

    DOES
      "There's nobody here who would be interested in buying" SAY THE item. "."

  END VERB sell.
END ADD TO.

-- Depending on the situation, it might be good to add a check whether the item is carried
-- by the hero or not, etc.



-- ==============================================================


----- SHAKE


-- ==============================================================


SYNTAX shake = shake (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.



ADD TO EVERY OBJECT
  VERB shake
    CHECK my_game CAN shake
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND obj IS movable
      ELSE SAY check_obj_movable OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      IF obj IN hero
        THEN "You shake" SAY THE obj. "cautiously in your hands. Nothing happens."
        ELSE "There is no reason to start shaking" SAY THE obj. "."
      END IF.

  END VERB shake.
END ADD TO.



-- ==============================================================


----- SHOOT


-- ==============================================================



SYNTAX shoot = shoot (target)
  WHERE target ISA THING
    ELSE
      IF target IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

         shoot = shoot 'at' (target).


ADD TO EVERY THING
    VERB shoot
    CHECK my_game CAN shoot
      ELSE SAY restricted_response OF my_game.
    AND target IS examinable
      ELSE
        IF target IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND target <> hero
      ELSE SAY check_obj_not_hero2 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND target NOT IN hero
      ELSE
        IF target IS NOT worn
          THEN SAY my_game:check_obj_not_in_hero1.
          ELSE SAY my_game:check_obj_not_in_worn2.
        END IF.
    AND target IS NOT distant
      ELSE
        IF target IS NOT plural
          THEN SAY check_obj_not_distant_sg OF my_game.
          ELSE SAY check_obj_not_distant_pl OF my_game.
        END IF.

    DOES
      IF target ISA ACTOR
        THEN "That's quite uncalled-for."
        ELSE "That wouldn't accomplish anything."
      END IF.

  END VERB shoot.
END ADD TO.


-- note that it is possible to shoot (at) both not reachable and distant objects.


-- another  'shoot' formulation added, to guide players to use the right phrasing:


SYNTAX shoot_error = shoot.


VERB shoot_error
  DOES
    "You must state what you want to shoot, for example SHOOT BEAR WITH RIFLE."
END VERB shoot_error.



-- ==============================================================


----- SHOOT WITH


-- ==============================================================


SYNTAX shoot_with = shoot (target) 'with' (weapon)
    WHERE target ISA THING
      ELSE
        IF target IS NOT plural
          THEN SAY illegal_parameter_sg OF my_game.
          ELSE SAY illegal_parameter_pl OF my_game.
        END IF.
    AND weapon ISA WEAPON
      ELSE
        IF weapon IS NOT plural
          THEN SAY illegal_parameter2_with_sg OF my_game.
          ELSE SAY illegal_parameter2_with_pl OF my_game.
        END IF.

   shoot_with = shoot (weapon) 'at' (target).
    -- to allow player input such as 'shoot rifle at bear'


ADD TO EVERY THING
  VERB shoot_with
    WHEN target
      CHECK my_game CAN shoot_with
        ELSE SAY restricted_response OF my_game.
      AND target IS examinable
        ELSE
          IF target IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND target <> hero
        ELSE SAY check_obj_not_hero2 OF my_game.
      AND target <> weapon
        ELSE SAY check_obj_not_obj2_with OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND target NOT IN hero
        ELSE
          IF target IS NOT worn
            THEN SAY my_game:check_obj_not_in_hero1.
            ELSE SAY my_game:check_obj_not_in_worn2.
          END IF.
      AND target IS NOT distant
        ELSE
          IF target IS NOT plural
            THEN SAY check_obj_not_distant_sg OF my_game.
            ELSE SAY check_obj_not_distant_pl OF my_game.
          END IF.

    DOES
      IF target ISA ACTOR
        THEN "That's quite uncalled-for."
        ELSE "That wouldn't accomplish anything."
      END IF.

  END VERB shoot_with.
END ADD TO.



-- ==============================================================


----- SHOUT


-- ==============================================================


SYNTAX shout = shout.

SYNONYMS scream, yell = shout.


VERB shout
  CHECK my_game CAN shout
    ELSE SAY restricted_response OF my_game.
    DOES
        "Nothing results from your $ving."
END VERB shout.




-- ==============================================================


----- SHOW


-- ==============================================================


SYNTAX 'show' = 'show' (obj) 'to' (act)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND act ISA ACTOR
    ELSE
      IF act IS NOT plural
        THEN SAY illegal_parameter2_to_sg OF my_game.
        ELSE SAY illegal_parameter2_to_pl OF my_game.
      END IF.

SYNONYMS reveal = 'show'.


ADD TO EVERY OBJECT
  VERB 'show'
    WHEN obj
      CHECK my_game CAN 'show'
        ELSE SAY restricted_response OF my_game.
      AND act <> hero
        ELSE SAY check_obj2_not_hero1 OF my_game.
      AND obj IN hero
        ELSE SAY check_obj_in_hero OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND act IS NOT distant
        ELSE
          IF act IS NOT plural
            THEN SAY check_obj2_not_distant_sg OF my_game.
            ELSE SAY check_obj2_not_distant_pl OF my_game.
          END IF.
    DOES
      SAY THE act.
      IF act IS NOT plural
        THEN "is"
        ELSE "are"
      END IF.
      "not especially interested."

  END VERB 'show'.
END ADD TO.




-- ==============================================================


----- SING (+ hum, whistle)


-- ==============================================================


SYNTAX sing = sing.

SYNONYMS hum, whistle = sing.


VERB sing
  CHECK my_game CAN sing
    ELSE SAY restricted_response OF my_game.
  DOES
    "You $v a little tune."
END VERB sing.




-- ==============================================================


----- SIP


-- ==============================================================


SYNTAX sip = sip (liq)
  WHERE liq ISA LIQUID
    ELSE
      IF liq IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY LIQUID
  VERB sip
    CHECK my_game CAN sip
      ELSE SAY restricted_response OF my_game.
    AND liq IS drinkable
      ELSE
        IF liq IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND liq IS reachable AND liq IS NOT distant
      ELSE
        IF liq IS NOT reachable
          THEN
            IF liq IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF liq IS distant
          THEN
            IF liq IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      IF vessel OF liq = null_vessel
        -- here, if the liquid is in no container, for example
        -- the hero takes a sip of water from a river,
        -- the action is allowed to succeed.
        THEN "You take a sip of" SAY THE liq. "."
        ELSE
          -- >>> implicit take >>>
          IF vessel OF liq NOT DIRECTLY IN hero
            THEN
              IF vessel OF liq IS NOT takeable
                THEN "You can't carry" SAY THE liq. "around in your bare hands."
                  -- the action stops here if the container is not takeable.
                ELSE LOCATE vessel OF liq IN hero.
                "(taking" SAY THE vessel OF liq. "first)$n"
              END IF.
          END IF.
          -- <<< implicit take <<<
      END IF.

      IF liq IN hero    -- i.e. if the implicit taking was successful
        THEN
          IF vessel OF liq IS NOT open
            THEN "You can't, since" SAY THE vessel OF liq. "is closed."
            ELSE "You take a sip of" SAY THE liq. "."
          END IF.
      END IF.

  END VERB sip.
END ADD TO.


-- See also the verb 'drink'.


-- ==============================================================


----- SIT


-- ==============================================================


SYNTAX sit = sit.

       sit = sit 'down'.


VERB sit
  CHECK my_game CAN sit
    ELSE SAY restricted_response OF my_game.
  AND hero IS NOT sitting
    ELSE SAY check_hero_not_sitting4 OF my_game.

  DOES
    "You feel no urge to sit down at present."
    -- (or, if you wish to make it work, use the following instead of the above:
    -- IF hero IS lying_down
    --  THEN "You sit up."
    --    MAKE hero NOT lying_down.
    --  ELSE "You sit down."
    -- END IF.
    -- MAKE hero sitting.
END VERB sit.

-- When the hero is sitting or lying down, it will be impossible for her/him to
-- perform certain actions, as numerous verbs in the library have checks for this.
-- For example, if the hero is sitting and the player types 'attack [something]',
-- the response will be "It will be difficult to attack anything while
-- sitting down."

-- Also, it is often essential to make certain objects NOT reachable when
-- sitting or lying down.



-- ==============================================================


----- SIT_ON


-- ==============================================================


SYNTAX sit_on = sit 'on' (surface)
  WHERE surface ISA SUPPORTER
    ELSE
      IF surface IS NOT plural
        THEN SAY illegal_parameter_on_sg OF my_game.
        ELSE SAY illegal_parameter_on_pl OF my_game.
      END IF.


ADD TO EVERY SUPPORTER
  VERB sit_on
    CHECK my_game CAN sit_on
      ELSE SAY restricted_response OF my_game.
    AND hero IS NOT sitting
      ELSE SAY check_hero_not_sitting4 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND surface IS reachable AND surface IS NOT distant
      ELSE
        IF surface IS NOT reachable
          THEN
            IF surface IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF surface IS distant
          THEN
            IF surface IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "You feel no urge to sit down at present."

      -- (or, to make it work, use the following instead of the above:)
      -- IF hero lying_down
      --  THEN "You get up and sit down on" SAY THE surface. "."
      --    MAKE hero NOT lying_down.
      --  ELSE "You sit down on" SAY THE surface. "."
      -- END IF.
      -- MAKE hero sitting.

  END VERB sit_on.
END ADD TO.


-- When the hero is sitting or lying down, it will be impossible for her/him to
-- perform certain actions, as numerous verbs in the library have checks for this.
-- For example, if the hero is sitting and the player types 'attack [something]',
-- the response will be "It will be difficult to attack anything while
-- sitting down."

-- Also, it is often essential to make certain objects NOT reachable when
-- sitting or lying down.



-- ==============================================================


----- SLEEP (+ rest)


-- ==============================================================


SYNTAX sleep = sleep.

SYNONYMS rest = sleep.


VERB sleep
  CHECK my_game CAN sleep
    ELSE SAY restricted_response OF my_game.
  DOES
    "There's no need to $v right now."
END VERB sleep.




-- ==============================================================


----- SMELL (smell0)


-- ==============================================================


SYNTAX smell0 = smell.


VERB smell0
  CHECK my_game CAN smell0
    ELSE SAY restricted_response OF my_game.
  DOES
    "You smell nothing unusual."
END VERB smell0.



-- ==============================================================


----- SMELL (+ obj)


-- ==============================================================


SYNTAX smell = smell (odour)
  WHERE odour ISA THING
    ELSE
      IF odour IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY THING
  VERB smell
    CHECK my_game CAN smell
      ELSE SAY restricted_response OF my_game.
    DOES
      "You smell nothing unusual."
  END VERB smell.
END ADD TO.



-- ==============================================================


----- SQUEEZE


-- ==============================================================


SYNTAX squeeze = squeeze (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY THING
  VERB squeeze
    CHECK my_game CAN squeeze
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "Trying to squeeze" SAY THE obj. "wouldn't accomplish anything."

  END VERB squeeze.
END ADD TO.



-- ==============================================================


----- STAND


-- ==============================================================


SYNTAX stand = stand.

   stand = stand 'up'.


VERB stand
  CHECK my_game CAN stand
    ELSE SAY restricted_response OF my_game.
  DOES
    IF hero IS sitting OR hero IS lying_down
      THEN "You get up."
        MAKE hero NOT sitting.
        MAKE hero NOT lying_down.
      ELSE "You're standing up already."
    END IF.
END VERB stand.



-- ==============================================================


----- STAND_ON


-- ==============================================================


SYNTAX stand_on = stand 'on' (surface)
  WHERE surface ISA SUPPORTER
    ELSE
      IF surface IS NOT plural
        THEN SAY illegal_parameter_on_sg OF my_game.
        ELSE SAY illegal_parameter_on_pl OF my_game.
      END IF.

        stand_on = get 'on' (surface).


ADD TO EVERY SUPPORTER
  VERB stand_on
    CHECK my_game CAN stand_on
      ELSE SAY restricted_response OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND surface IS reachable AND surface IS NOT distant
      ELSE
        IF surface IS NOT reachable
          THEN
            IF surface IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF surface IS distant
          THEN
            IF surface IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "You feel no urge to stand on" SAY THE surface. "."
      -- or, to make it work, use the following instead of the above:
      -- "You get on" SAY THE surface. "."
      -- (Make an attribute for the hero to check that he's on the surface.
      -- It is not possible to actually locate him on the surface (unless
      -- you implement a nested location.)
      -- MAKE hero NOT sitting. MAKE hero NOT lying_down.

  END VERB stand_on.
END ADD TO.



-- ==============================================================


----- SWIM


-- ==============================================================


SYNTAX swim = swim.


VERB swim
  CHECK my_game CAN swim
    ELSE SAY restricted_response OF my_game.
  AND hero IS NOT sitting
    ELSE SAY check_hero_not_sitting1 OF my_game.
  AND hero IS NOT lying_down
    ELSE SAY check_hero_not_lying_down1 OF my_game.
  AND CURRENT LOCATION IS lit
    ELSE SAY check_current_loc_lit OF my_game.
  DOES
    "There is no water suitable for swimming here."
END VERB swim.



-- ==============================================================


----- SWIM IN


-- ==============================================================


SYNTAX swim_in = swim 'in' (liq)
  WHERE liq ISA LIQUID
    ELSE
      IF liq IS NOT plural
        THEN SAY illegal_parameter_in_sg OF my_game.
        ELSE SAY illegal_parameter_in_pl OF my_game.
      END IF.



ADD TO EVERY OBJECT
  VERB swim_in
    CHECK my_game CAN swim_in
      ELSE SAY restricted_response OF my_game.
    AND hero IS NOT sitting
      ELSE SAY check_hero_not_sitting3 OF my_game.
    AND hero IS NOT lying_down
      ELSE SAY check_hero_not_lying_down3 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND liq IS reachable AND liq IS NOT distant
      ELSE
        IF liq IS NOT reachable
          THEN
            IF liq IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF liq IS distant
          THEN
            IF liq IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      IF liq IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "something you can swim in."

  END VERB swim_in.
END ADD TO.



-- ==============================================================


----- SWITCH


-- ==============================================================


-- This is a mere 'switch' verb with no 'on' or 'off' following after it.
-- This verb is defined further in 'classes.i', under 'device' and 'lightsource'.
-- This verb exists just to cover cases where the player forgets to write
-- 'on' or 'off' after 'switch'.
-- If the player types 'switch tv', the tv object will be switched on
-- if it is off, and vice cersa.
-- Below, just the basic syntax is declared.



SYNTAX switch = switch (app)      -- app = apparatus, appliance
  WHERE app ISA OBJECT
    ELSE
      IF app IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB switch
    CHECK my_game CAN switch
      ELSE SAY restricted_response OF my_game.
    DOES
      IF app IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "not something you can switch."
  END VERB switch.
END ADD TO.



-- ==============================================================


----- SWITCH ON


-- ==============================================================


----- The syntax for 'switch on' has been declared in the 'turn_on' verb.




-- ==============================================================


----- SWITCH OFF


-- ==============================================================


----- The syntax for 'switch off' has been declared in the 'turn_off' verb.




-- ==============================================================


----- TAKE  (+ carry, get, grab, hold, obtain, pick up)


-- ==============================================================


SYNTAX take = take (obj)
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

        take = get (obj).

        take = pick up (obj).

        take = pick (obj) up.

SYNONYMS carry, grab, hold, obtain = take.


ADD TO EVERY THING
  VERB take
    CHECK my_game CAN take
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND obj <> hero
      ELSE SAY check_obj_not_hero1 OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS NOT scenery
      ELSE
        IF THIS IS NOT plural
          THEN SAY check_obj_not_scenery_sg OF my_game.
          ELSE SAY check_obj_not_scenery_pl OF my_game.
        END IF.
    AND obj IS movable
      ELSE SAY check_obj_movable OF my_game.
    AND obj IS takeable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND obj NOT DIRECTLY IN hero
      -- i.e. the object to be taken is not carried by the hero already
      ELSE SAY check_obj_not_in_hero2 OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.
    AND weight OF obj < 50
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_weight_sg OF my_game.
          ELSE SAY check_obj_weight_pl OF my_game.
        END IF.

    DOES
      IF obj ISA ACTOR
        THEN SAY THE obj. "would probably object to that."
      -- actors are not prohibited from being taken in the checks; this is to
      -- allow for example a dog to be picked up, or a bird to be taken out of
      -- a cage, etc.
      ELSIF obj IsA OBJECT THEN
        LOCATE obj IN hero.
        MAKE obj NOT worn. -- for non-clothing wearables.
        "Taken."
      END IF.

        -- Objects held by NPCs cannot be taken by the hero by default.
        -- The hero must *ask for* the object to obtain it.

  END VERB take.
END ADD TO.




-- ==============================================================


-----  TAKE FROM


-- ==============================================================


SYNTAX take_from = 'take' (obj) 'from' (holder)
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND holder ISA THING
    ELSE
      IF holder IS NOT plural
        THEN SAY illegal_parameter2_from_sg OF my_game.
        ELSE SAY illegal_parameter2_from_pl OF my_game.
      END IF.
  AND holder ISA CONTAINER
    ELSE
      IF holder IS NOT plural
        THEN SAY illegal_parameter2_from_sg OF my_game.
        ELSE SAY illegal_parameter2_from_pl OF my_game.
      END IF.

        take_from = remove (obj)* 'from' (holder).

        take_from = get (obj) 'from' (holder).


ADD TO EVERY THING
  VERB take_from
    WHEN obj
      CHECK my_game CAN take_from
        ELSE SAY restricted_response OF my_game.
      AND obj <> hero
        ELSE SAY check_obj_not_hero1 OF my_game.
      AND holder <> hero
        ELSE SAY check_obj2_not_hero1 OF my_game.
      AND obj NOT DIRECTLY IN hero
        ELSE  SAY check_obj_not_in_hero2 OF my_game.
      AND obj <> holder
        ELSE SAY check_obj_not_obj2_from OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj IS NOT scenery
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_not_scenery_sg OF my_game.
            ELSE SAY check_obj_not_scenery_pl OF my_game.
          END IF.
      AND holder IS NOT scenery
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj2_not_scenery_sg OF my_game.
            ELSE SAY check_obj2_not_scenery_pl OF my_game.
          END IF.
      AND obj IS movable
        ELSE SAY check_obj_movable OF my_game.
      AND obj IS takeable
            ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND holder IS reachable AND holder IS NOT distant
        ELSE
          IF holder IS NOT reachable
            THEN
              IF holder IS NOT plural
                THEN SAY check_obj2_reachable_sg OF my_game.
                ELSE SAY check_obj2_reachable_pl OF my_game.
              END IF.
          ELSIF holder IS distant
            THEN
              IF holder IS NOT plural
                THEN SAY check_obj2_not_distant_sg OF my_game.
                ELSE SAY check_obj2_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND weight OF obj < 50
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_weight_sg OF my_game.
            ELSE SAY check_obj_weight_pl OF my_game.
          END IF.
      AND obj IN holder
        ELSE
          IF holder IS inanimate
            THEN
              IF holder ISA SUPPORTER
                THEN
                  IF obj IS NOT plural
                    THEN SAY check_obj_on_surface_sg OF my_game.
                    ELSE SAY check_obj_on_surface_pl OF my_game.
                  END IF.
                ELSE
                  IF obj IS NOT plural
                    THEN SAY check_obj_in_cont_sg OF my_game.
                    ELSE SAY check_obj_in_cont_pl OF my_game.
                  END IF.
              END IF.
            ELSE
              IF holder IS NOT plural
                THEN SAY check_obj_in_act_sg OF my_game.
                ELSE SAY check_obj_in_act_pl OF my_game.
              END IF.
          END IF.

    DOES
      IF obj ISA ACTOR
        THEN SAY THE obj. "would probably object to that."
          -- actors are not prohibited from being taken in the checks; this is to
          -- allow for example a dog to be picked up, or a bird to be taken out of
          -- a cage, etc.
      ELSIF obj ISA OBJECT
        THEN
          IF holder ISA LISTED_CONTAINER AND holder IS NOT open
            THEN "You can't;" SAY THE holder.
              IF holder IS NOT plural
                THEN "is"
                ELSE "are"
              END IF.
              "closed."
            ELSE
              LOCATE obj IN hero.
              "You take" SAY THE obj. "from" SAY THE holder. "."
          END IF.
      END IF.

        -- Objects held by NPCs cannot be taken by the hero by default.
        -- The hero must *ask for* the object to obtain it.

  END VERB take_from.
END ADD TO.



-- ==============================================================


----- TALK


-- ==============================================================


SYNTAX talk = talk.


VERB talk
  CHECK my_game CAN talk
    ELSE SAY restricted_response OF my_game.
  DOES
    "To talk to somebody, you can ASK PERSON ABOUT THING
     or TELL PERSON ABOUT THING."
END VERB talk.



-- ==============================================================


----- TALK_TO


-- ==============================================================


SYNTAX talk_to = talk 'to' (act)
  WHERE act ISA ACTOR
    ELSE
      IF act IS NOT plural
        THEN SAY illegal_parameter_to_sg OF my_game.
        ELSE SAY illegal_parameter_to_pl OF my_game.
      END IF.


ADD TO EVERY ACTOR
  VERB talk_to
    CHECK my_game CAN talk_to
      ELSE SAY restricted_response OF my_game.
    DOES
      "To talk to somebody, you can ASK PERSON ABOUT THING or
       TELL PERSON ABOUT THING."
  END VERB talk_to.
END ADD TO.



-- ==============================================================


----- TASTE   (+ lick)


-- ==============================================================


SYNTAX taste = taste (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

SYNONYMS lick = taste.


ADD TO EVERY OBJECT
  VERB taste
    CHECK my_game CAN taste
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND obj IS edible OR obj IS drinkable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "You taste nothing unexpected."

  END VERB taste.
END ADD TO.




-- ==============================================================


----- TEAR  (+ rip)


-- ==============================================================


SYNTAX tear = tear (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

SYNONYMS rip = tear.


ADD TO EVERY OBJECT
  VERB tear
    CHECK my_game CAN tear
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      "Trying to $v" SAY THE obj. "would be futile."

  END VERB tear.
END ADD TO.




-- ==============================================================


----- TELL  (+ enlighten, inform)


-- ==============================================================


SYNTAX tell = tell (act) about (topic)!
  WHERE act ISA ACTOR
    ELSE
      IF act IS NOT plural
            THEN SAY illegal_parameter_talk_sg OF my_game.
        ELSE SAY illegal_parameter_talk_pl OF my_game.
      END IF.
  AND topic ISA THING
    ELSE
      IF topic IS NOT plural
        THEN SAY illegal_parameter_about_sg OF my_game.
        ELSE SAY illegal_parameter_about_pl OF my_game.
      END IF.

SYNONYMS enlighten, inform = tell.


ADD TO EVERY ACTOR
  VERB tell
    WHEN act
      CHECK my_game CAN tell
        ELSE SAY restricted_response OF my_game.
      AND act <> hero
        ELSE SAY check_obj_not_hero1 OF my_game.
      AND act CAN talk
        ELSE
          IF act IS NOT plural
            THEN SAY check_act_can_talk_sg OF my_game.
            ELSE SAY check_act_can_talk_pl OF my_game.
          END IF.
      AND act IS NOT distant
        ELSE
          IF act IS NOT plural
            THEN SAY check_obj_not_distant_sg OF my_game.
            ELSE SAY check_obj_not_distant_pl OF my_game.
          END IF.

    DOES
      SAY THE act.
      IF act IS NOT plural
        THEN "doesn't"
        ELSE "don't"
      END IF.
      "look interested."

  END VERB tell.
END ADD TO.




-- ==============================================================


----- THINK   (+ ponder, meditate, reflect)


-- ==============================================================


SYNTAX think = think.

SYNONYMS ponder, meditate, reflect = think.


VERB think
  CHECK my_game CAN think
    ELSE SAY restricted_response OF my_game.
  DOES
    "Nothing helpful comes to your mind."
END VERB think.




-- ==============================================================


----- THINK ABOUT


-- ==============================================================


SYNTAX think_about = think 'about' (topic)!
  WHERE topic ISA THING
    ELSE
      IF topic IS NOT plural
        THEN SAY illegal_parameter_about_sg OF my_game.
        ELSE SAY illegal_parameter_about_pl OF my_game.
      END IF.


ADD TO EVERY THING
  VERB think_about
    CHECK my_game CAN think_about
      ELSE SAY restricted_response OF my_game.
    DOES
      "Nothing helpful comes to your mind."
    END VERB think_about.
END ADD TO.



-- ==============================================================


----- THROW


-- ==============================================================


SYNTAX throw = throw (projectile)
  WHERE projectile ISA OBJECT
    ELSE SAY illegal_parameter_obj OF my_game.



ADD TO EVERY OBJECT
  VERB throw
    CHECK my_game CAN throw
      ELSE SAY restricted_response OF my_game.
    AND projectile IS examinable
      ELSE
        IF projectile IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND projectile IS takeable
      ELSE SAY check_obj_takeable OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND projectile IS reachable AND projectile IS NOT distant
      ELSE
        IF projectile IS NOT reachable
          THEN
            IF projectile IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF projectile IS distant
          THEN
            IF projectile IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      -- >>> implicit take >>>
      IF projectile NOT DIRECTLY IN hero
        THEN LOCATE projectile IN hero.
          SAY implicit_taking_message OF my_game.
      END IF.
      -- <<< implicit take <<<

      "You can't throw very far;" SAY THE projectile.

      IF projectile IS NOT plural
        THEN "ends up"
        ELSE "end up"
      END IF.

      IF floor HERE
        THEN "on the floor"
      ELSIF ground HERE
        THEN "on the ground"
      END IF.

      "nearby."
      LOCATE projectile AT hero.
      MAKE projectile NOT worn. -- for non-clothing wearables.

  END VERB throw.
END ADD TO.




-- ==============================================================


----- THROW AT


-- ==============================================================


SYNTAX throw_at = throw (projectile) 'at' (target)
  WHERE projectile ISA OBJECT
    ELSE SAY illegal_parameter_obj OF my_game.
  AND target ISA THING
    ELSE SAY illegal_parameter_at OF my_game.



ADD TO EVERY OBJECT
  VERB throw_at
    WHEN projectile
      CHECK my_game CAN throw_at
        ELSE SAY restricted_response OF my_game.
      AND projectile IS examinable
        ELSE
          IF projectile IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND projectile IS takeable
        ELSE SAY check_obj_takeable OF my_game.
      AND target IS examinable
        ELSE SAY check_obj_suitable_at OF my_game.
      AND projectile <> target
        ELSE SAY check_obj_not_obj2_at OF my_game.
      AND target NOT IN hero
        ELSE
          IF target IS NOT worn
            THEN SAY my_game:check_obj_not_in_hero1.
            ELSE SAY my_game:check_obj_not_in_worn2.
          END IF.
      AND target <> hero
        ELSE SAY check_obj2_not_hero1 OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND projectile IS reachable AND projectile IS NOT distant
        ELSE
          IF projectile IS NOT reachable
            THEN
              IF projectile IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF projectile IS distant
            THEN
              IF projectile IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND target IS NOT distant
        -- it is possible to throw something at an (otherwise) not reachable target
        ELSE
          IF target IS NOT plural
            THEN SAY check_obj2_not_distant_sg OF my_game.
            ELSE SAY check_obj2_not_distant_pl OF my_game.
          END IF.

    DOES
      -- >>> implicit take >>>
      IF projectile NOT DIRECTLY IN hero
        THEN LOCATE projectile IN hero.
             SAY implicit_taking_message OF my_game.
      END IF.
      -- <<< implicit take <<<
      MAKE projectile NOT worn. -- for non-clothing wearables.

      IF target IS inanimate
        THEN
          IF target NOT DIRECTLY AT hero
            -- for example the target is inside a box
            THEN "It wouldn't accomplish anything trying to throw
               something at" SAY THE target. "."
            ELSE
              SAY THE projectile.

              IF projectile IS NOT plural
                THEN "bounces"
                ELSE "bounce"
              END IF.

              "harmlessly off"

              SAY THE target. "and"

              IF projectile IS NOT plural
                THEN "ends up"
                ELSE "end up"
              END IF.

                IF floor HERE
                THEN "on the floor"
              ELSIF ground HERE
                THEN "on the ground"
                END IF.

                  "nearby."
                LOCATE projectile AT hero.
          END IF.

        ELSE SAY THE target. "wouldn't probably appreciate that."
          -- Throwing objects at actors is not disabled in the checks
          -- as in some situations this might be desired, for example
          -- when attacking enemies.
        END IF.

  END VERB throw_at.
END ADD TO.



-- ==============================================================


----- THROW TO


-- ==============================================================


SYNTAX throw_to = throw (projectile) 'to' (recipient)
  WHERE projectile ISA OBJECT
    ELSE SAY illegal_parameter_obj OF my_game.
  AND recipient ISA ACTOR
    ELSE SAY illegal_parameter2_there OF my_game.


ADD TO EVERY OBJECT
  VERB throw_to
    WHEN projectile
      CHECK my_game CAN throw_to
        ELSE SAY restricted_response OF my_game.
      AND projectile IS examinable
        ELSE
          IF projectile IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND projectile IS takeable
        ELSE SAY check_obj_takeable OF my_game.
      AND recipient IS examinable
        ELSE SAY check_obj_suitable_at OF my_game.
      AND projectile <> recipient
        ELSE SAY check_obj_not_obj2_to OF my_game.
      AND recipient <> hero
        ELSE SAY check_obj2_not_hero1 OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND projectile IS reachable AND projectile IS NOT distant
        ELSE
          IF projectile IS NOT reachable
            THEN
              IF projectile IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF projectile IS distant
            THEN
              IF projectile IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND recipient IS NOT distant
        ELSE
          IF recipient IS NOT plural
            THEN SAY check_obj2_not_distant_sg OF my_game.
            ELSE SAY check_obj2_not_distant_pl OF my_game.
          END IF.

    DOES
      "It wouldn't accomplish anything trying to throw"
      SAY the projectile. "to" SAY THE recipient. "."

  END VERB throw_to.
END ADD TO.



-- ==============================================================


------ THROW IN


-- ==============================================================


SYNTAX throw_in = throw (projectile) 'in' (cont)
  WHERE projectile ISA OBJECT
    ELSE SAY illegal_parameter_obj OF my_game.
  AND cont ISA OBJECT
    ELSE
      IF cont ISA ACTOR
        THEN SAY illegal_parameter_act OF my_game.
        ELSE SAY illegal_parameter2_there OF my_game.
      END IF.
  AND cont ISA CONTAINER
    ELSE SAY illegal_parameter2_there OF my_game.


ADD TO EVERY OBJECT
  VERB throw_in
    WHEN projectile
      CHECK my_game CAN throw_in
        ELSE SAY restricted_response OF my_game.
      AND projectile IS examinable
        ELSE
          IF projectile IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND projectile IS takeable
        ELSE SAY check_obj_takeable OF my_game.
      AND cont IS examinable
        ELSE SAY check_obj2_suitable_there OF my_game.
      AND projectile <> cont
        ELSE SAY check_obj_not_obj2_in OF my_game.
      AND cont <> hero
        ELSE SAY check_obj2_not_hero1 OF my_game.
      AND cont NOT IN hero
        ELSE
          IF cont IS NOT worn
            THEN SAY my_game:check_obj_not_in_hero1.
            ELSE SAY my_game:check_obj_not_in_worn2.
          END IF.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND projectile NOT IN cont
        ELSE
          IF projectile IS NOT plural
            THEN SAY check_obj_not_in_cont_sg OF my_game.
            ELSE SAY check_obj_not_in_cont_pl OF my_game.
          END IF.
      AND projectile IS reachable AND projectile IS NOT distant
        ELSE
          IF projectile IS NOT reachable
            THEN
              IF projectile IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF projectile IS distant
            THEN
              IF projectile IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND cont IS NOT distant
        ELSE
          IF cont IS NOT plural
            THEN SAY check_obj2_not_distant_sg OF my_game.
            ELSE SAY check_obj2_not_distant_pl OF my_game.
          END IF.
      AND projectile IN allowed OF cont
        ELSE
          IF projectile IS NOT plural
            THEN SAY check_obj_allowed_in_sg OF my_game.
            ELSE SAY check_obj_allowed_in_pl OF my_game.
          END IF.
      AND cont IS open
        ELSE
          IF cont IS NOT plural
            THEN SAY check_obj2_open_sg OF my_game.
            ELSE SAY check_obj2_open_pl OF my_game.
          END IF.

    DOES
      "It wouldn't accomplish anything trying to throw"
      SAY THE projectile. "into" SAY THE cont. "."

      -- Throwing objects into containers, even when these objects are
      -- in the 'allowed' set of the container, is not successful by
      -- default; this is to avoid successful outcomes for commands like
      -- 'throw plate into cupboard' etc.

  END VERB throw_in.
END ADD TO.



-- ==============================================================


----- TIE


-- ==============================================================


SYNTAX tie = tie (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB tie
    CHECK my_game CAN tie
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.

    DOES
      "You must state where you want to tie" SAY THE obj. "."

  END VERB tie.
END ADD TO.



-- ==============================================================


----- TIE TO


-- ==============================================================


SYNTAX tie_to = tie (obj) 'to' (target)
  WHERE obj ISA OBJECT
    ELSE SAY illegal_parameter_obj OF my_game.
  AND target ISA THING
    ELSE SAY illegal_parameter_obj OF my_game.



ADD TO EVERY THING
  VERB tie_to
    WHEN obj
      CHECK my_game CAN tie_to
        ELSE SAY restricted_response OF my_game.
      AND obj IS examinable
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND target IS examinable
        ELSE SAY check_obj2_suitable_there OF my_game.
      AND obj <> target
        ELSE SAY check_obj_not_obj2_to OF my_game.
      AND obj IS takeable
        ELSE SAY check_obj_takeable OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND target IS reachable AND target IS NOT distant
        ELSE
          IF target IS NOT reachable
            THEN
              IF target IS NOT plural
                THEN SAY check_obj2_reachable_sg OF my_game.
                ELSE SAY check_obj2_reachable_pl OF my_game.
              END IF.
          ELSIF target IS distant
            THEN
              IF target IS NOT plural
                THEN SAY check_obj2_not_distant_sg OF my_game.
                ELSE SAY check_obj2_not_distant_pl OF my_game.
              END IF.
          END IF.

    DOES
      "It's not possible to tie" SAY THE obj. "to" SAY THE target. "."

  END VERB tie_to.
END ADD TO.



-- ==============================================================


----- TOUCH


-- ==============================================================


SYNTAX touch = touch (obj)
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

SYNONYMS feel = touch.


ADD TO EVERY THING
  VERB touch
    CHECK my_game CAN touch
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.
    AND obj <> hero
      ELSE SAY check_obj_not_hero3 OF my_game.
    AND obj IS inanimate
      ELSE SAY check_obj_inanimate2 OF my_game.

    DOES
      "You feel nothing unexpected."

  END VERB touch.
END ADD TO.




-- ==============================================================


----- TOUCH WITH


-- ==============================================================


SYNTAX touch_with = touch (obj) 'with' (instr)
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND instr ISA OBJECT
    ELSE
      IF instr IS NOT plural
        THEN SAY illegal_parameter2_with_sg OF my_game.
        ELSE SAY illegal_parameter2_with_pl OF my_game.
      END IF.


ADD TO EVERY THING
  VERB touch_with
    WHEN obj
      CHECK my_game CAN touch_with
        ELSE SAY restricted_response OF my_game.
      AND obj IS examinable
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND instr IS examinable
        ELSE
          IF instr IS NOT plural
            THEN SAY check_obj2_suitable_with_sg OF my_game.
            ELSE SAY check_obj2_suitable_with_pl OF my_game.
        END IF.
      AND obj <> instr
        ELSE SAY check_obj_not_obj2_with OF my_game.
      AND instr <> hero
        ELSE SAY check_obj2_not_hero1 OF my_game.
      AND instr IN hero
        ELSE SAY check_obj2_in_hero OF my_game.
      AND obj IS inanimate
        ELSE SAY check_obj_inanimate2 OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.

    DOES
      "You touch" SAY THE obj. "with" SAY THE instr. ". Nothing special happens."

  END VERB touch_with.
END ADD TO.



-- ==============================================================


----- TURN  (+ rotate)


-- ==============================================================


SYNTAX turn = turn (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF my_game CAN NOT turn
        THEN
          "The verb '$v' is not in your vocabulary."
        ELSE
          IF obj IS NOT plural
            THEN SAY illegal_parameter_sg OF my_game.
            ELSE SAY illegal_parameter_pl OF my_game.
          END IF.
      END IF.




ADD TO EVERY OBJECT
  VERB turn
    CHECK my_game CAN turn
      ELSE SAY restricted_response OF my_game.
    AND obj IS examinable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND obj IS movable
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      IF obj DIRECTLY IN hero
        THEN "You turn" SAY THE obj. "in your hands, noticing nothing special."
        ELSE "That wouldn't accomplish anything."
      END IF.

  END VERB turn.
END ADD TO.



-- ==============================================================


----- TURN ON


-- ==============================================================


----- Only devices and lightsources can be turned on and off. These classes are
----- defined in 'classes.i' with proper checks for 'on' and 'NOT on', 'lit' and 'NOT lit'.
----- Trying to turn on or off an ordinary object will default here to "That's not
----- something you can turn on".


SYNTAX turn_on = turn 'on' (app)
  WHERE app ISA OBJECT
    ELSE
      IF app IS NOT plural
        THEN SAY illegal_parameter_on_sg OF my_game.
        ELSE SAY illegal_parameter_on_pl OF my_game.
      END IF.

    turn_on = switch 'on' (app).

      turn_on = turn (app) 'on'.

      turn_on = switch (app) 'on'.



-- Note that 'switch' is not declared a synonym for 'turn'.
-- This is because 'turn' has also other meanings, for example 'turn page' which is
-- not equal with 'switch page'.
-- A separate 'switch' verb is declared in 'classes.i', classes 'device' and 'lightsource'.
-- This verb merely covers cases where the player forgets (or doesn't bother) to type 'on' or 'off'.



ADD TO EVERY OBJECT
  VERB turn_on
    CHECK my_game CAN turn_on
      ELSE SAY restricted_response OF my_game.

    DOES
      IF app IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "something you can $v on."

  END VERB turn_on.
END ADD TO.



-- ==============================================================


----- TURN OFF


-- ==============================================================


----- Only devices and lightsources can be turned on and off. These classes
----- are defined in 'classes.i' with proper checks for 'on' and 'NOT on',
----- 'lit' and 'NOT lit'.


SYNTAX turn_off = turn off (app)
  WHERE app ISA OBJECT
    ELSE
      IF app IS NOT plural
        THEN SAY illegal_parameter_off_sg OF my_game.
        ELSE SAY illegal_parameter_off_pl OF my_game.
      END IF.

        turn_off = switch off (app).

        turn_off = turn (app) off.

        turn_off = switch (app) off.



-- Note that 'switch' is not declared a synonym for 'turn'.
-- This is because 'turn' has also other meanings, for example 'turn page' which is
-- not equal with 'switch page'.
-- A separate 'switch' verb is declared in 'classes.i', classes 'device' and 'lightsource'.
-- This verb merely covers cases where the player forgets to type 'on' or 'off'.


ADD TO EVERY OBJECT
  VERB turn_off
    CHECK my_game CAN turn_off
      ELSE SAY restricted_response OF my_game.
    DOES
      IF app IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "something you can $v off."
  END VERB turn_off.
END ADD TO.



-- ==============================================================


----- UNDRESS


-- ==============================================================


SYNTAX undress = undress.


VERB undress
  CHECK my_game CAN undress
    ELSE SAY restricted_response OF my_game.
  AND CURRENT LOCATION IS lit
    ELSE SAY check_current_loc_lit OF my_game.
  
  DOES
    "You don't feel like undressing is a good idea right now."

    -- To make it work, use the following lines instead:
    -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    -- IF COUNT IsA clothing, DIRECTLY IN hero, IS worn > 0
    --   THEN
    --     "You remove all the items you were wearing."
    --     FOR EACH worncl IsA clothing, DIRECTLY IN hero, IS worn
    --       DO
    --         MAKE worncl NOT worn.
    --         LOCATE worncl AT CURRENT LOCATION.
    --     END FOR.
    --   ELSE "You're not wearing anything you can remove."
    -- END IF.
    -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
END VERB undress.



-- ==============================================================


----- UNLOCK


-- ==============================================================


SYNTAX unlock = unlock (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.


ADD TO EVERY OBJECT
  VERB unlock
    CHECK my_game CAN unlock
      ELSE SAY restricted_response OF my_game.
    AND obj IS lockable
          ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_suitable_sg OF my_game.
          ELSE SAY check_obj_suitable_pl OF my_game.
        END IF.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.
    AND obj IS locked
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_locked_sg OF my_game.
          ELSE SAY check_obj_locked_pl OF my_game.
        END IF.

    DOES
      IF matching_key OF obj IN hero
        THEN MAKE obj NOT locked.
          "(with" SAY THE matching_key OF obj. "$$)$n"
          "You unlock" SAY THE obj. "."
        ELSE "You don't have the key that unlocks" SAY THE obj. "."
      END IF.

  END VERB unlock.
END ADD TO.



-- =============================================================


----- UNLOCK WITH


-- =============================================================


SYNTAX unlock_with = unlock (obj) 'with' (key)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.
  AND key ISA OBJECT
    ELSE SAY illegal_parameter_with_sg OF my_game. "."


ADD TO EVERY OBJECT
  VERB unlock_with
    WHEN obj
      CHECK my_game CAN unlock_with
        ELSE SAY restricted_response OF my_game.
      AND obj IS lockable
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_suitable_sg OF my_game.
            ELSE SAY check_obj_suitable_pl OF my_game.
          END IF.
      AND key IS examinable
        ELSE
          IF key IS NOT plural
            THEN SAY check_obj2_suitable_with_sg OF my_game.
            ELSE SAY check_obj2_suitable_with_pl OF my_game.
          END IF.
      AND key IN hero
        ELSE SAY check_obj2_in_hero OF my_game.
      AND obj <> key
        ELSE SAY check_obj_not_obj2_with OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.
      AND obj IS locked
        ELSE
          IF obj IS NOT plural
            THEN SAY check_obj_locked_sg OF my_game.
            ELSE SAY check_obj_locked_pl OF my_game.
          END IF.
      AND key = matching_key OF obj
        ELSE SAY check_door_matching_key OF my_game.

    DOES
      MAKE obj NOT locked.
      "You unlock" SAY THE obj. "with" SAY THE key. "."

  END VERB unlock_with.
END ADD TO.



-- ==============================================================


----- USE


-- ==============================================================


SYNTAX 'use' = 'use' (obj)
  WHERE obj ISA OBJECT
    ELSE SAY illegal_parameter_obj OF my_game.



ADD TO EVERY OBJECT
  VERB 'use'
    CHECK my_game CAN 'use'
      ELSE SAY restricted_response OF my_game.

    DOES
      "Please be more specific. How do you intend to use"
      IF obj IS NOT plural
        THEN "it?"
        ELSE "them?"
      END IF.

  END VERB 'use'.
END ADD TO.



-- ==============================================================


----- USE WITH


-- ==============================================================


SYNTAX use_with = 'use' (obj) 'with' (instr)
  WHERE obj ISA OBJECT
    ELSE SAY illegal_parameter_obj OF my_game.
  AND instr ISA OBJECT
    ELSE SAY illegal_parameter_obj OF my_game.


ADD TO EVERY OBJECT
  VERB use_with
    WHEN obj
      CHECK my_game CAN use_with
        ELSE SAY restricted_response OF my_game.
      AND obj <> instr
        ELSE SAY check_obj_not_obj2_with OF my_game.

    DOES
      "Please be more specific. How do you intend to use them together?"

  END VERB use_with.
END ADD TO.




-- ==============================================================


----- WAIT (= z)


-- ==============================================================


SYNTAX 'wait' = 'wait'.

SYNONYMS z = 'wait'.


VERB 'wait'
  CHECK my_game CAN 'wait'
    ELSE SAY restricted_response OF my_game.
  DOES
    "Time passes..."
END VERB 'wait'.




-- ==============================================================


----- WEAR


-- ==============================================================



SYNTAX wear = wear (obj)
  WHERE obj ISA OBJECT
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_sg OF my_game.
        ELSE SAY illegal_parameter_pl OF my_game.
      END IF.

         wear = put 'on' (obj).
         wear = put (obj) 'on'.
         wear = don (obj).


ADD TO EVERY OBJECT
  VERB wear
    CHECK my_game CAN wear
      ELSE SAY restricted_response OF my_game.
    AND obj IS takeable
      ELSE SAY check_obj_takeable OF my_game.
    AND CURRENT LOCATION IS lit
      ELSE SAY check_current_loc_lit OF my_game.
    AND obj IS reachable AND obj IS NOT distant
      ELSE
        IF obj IS NOT reachable
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_reachable_sg OF my_game.
              ELSE SAY check_obj_reachable_pl OF my_game.
            END IF.
        ELSIF obj IS distant
          THEN
            IF obj IS NOT plural
              THEN SAY check_obj_not_distant_sg OF my_game.
              ELSE SAY check_obj_not_distant_pl OF my_game.
            END IF.
        END IF.

    DOES
      IF obj IS NOT plural
        THEN "That's not"
        ELSE "Those are not"
      END IF.
      "something you can wear."

  END VERB wear.
END ADD TO.




-- ==============================================================


----- WRITE


-- ==============================================================


SYNTAX write = write (txt) 'on' (obj)
  WHERE txt ISA STRING
    ELSE SAY illegal_parameter_string OF my_game.
  AND obj ISA OBJECT
    ELSE SAY illegal_parameter2_there OF my_game.

       write = write (txt) 'in' (obj).


ADD TO EVERY OBJECT
  VERB write
    WHEN obj
      CHECK my_game CAN write
        ELSE SAY restricted_response OF my_game.
      AND obj IS writeable
        ELSE SAY check_obj_writeable OF my_game.
      AND CURRENT LOCATION IS lit
        ELSE SAY check_current_loc_lit OF my_game.
      AND obj IS reachable AND obj IS NOT distant
        ELSE
          IF obj IS NOT reachable
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_reachable_sg OF my_game.
                ELSE SAY check_obj_reachable_pl OF my_game.
              END IF.
          ELSIF obj IS distant
            THEN
              IF obj IS NOT plural
                THEN SAY check_obj_not_distant_sg OF my_game.
                ELSE SAY check_obj_not_distant_pl OF my_game.
              END IF.
          END IF.

    DOES
      "You don't have anything to write with."

      -- To make it work:
        -- IF text OF obj = ""
        -- THEN SET text OF obj TO txt.
        -- ELSE SET text OF obj TO text OF obj + " " + txt.
        -- END IF.

      -- "You write ""$$" SAY txt. "$$"" on" SAY THE obj. "."
        -- MAKE obj readable.

  END VERB write.
END ADD TO.


-- A couple of other formulations are understood but they guide the player to
-- use the correct syntax:


SYNTAX write_error1 = write 'on' (obj)
  WHERE obj ISA OBJECT
    ELSE "Please use the formulation WRITE ""TEXT"" ON (IN) OBJECT
          to write something."


ADD TO EVERY OBJECT
  VERB write_error1
    DOES "Please use the formulation WRITE ""TEXT"" ON (IN) OBJECT
          to write something."
  END VERB write_error1.
END ADD TO.


SYNTAX write_error2 = write.

VERB write_error2
  DOES "Please use the formulation WRITE ""TEXT"" ON (IN) OBJECT
        to write something."
END VERB write_error2.


SYNTAX write_error3 = write (txt)
  WHERE txt ISA STRING
    ELSE "Please use the formulation WRITE ""TEXT"" ON (IN) OBJECT
          to write something."


ADD TO EVERY STRING
  VERB write_error3
    DOES "Please use the formulation WRITE ""TEXT"" ON (IN) OBJECT
          to write something."
  END VERB write_error3.
END ADD TO.

-->questions_verbs(30000)
--~=============================================================================
--~* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--~ * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--~-----------------------------------------------------------------------------
--|
--| == Questions and Answers Verbs
--|
--~-----------------------------------------------------------------------------
--~* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--~ * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--~=============================================================================
--| 
--| This group includes all those verbs which don't follow the usual convention
--| of imparting a direct command to the main character (e.g. "`take apple`"),
--| but instead are questions or answers provided by the main character itself
--| (e.g. "`who am I?`", "`yes`", "`where is the treasure?`").
--<

-->table_questions_verbs(1030)
--| === Table of Questions and Answers Verbs
--| [cols="15m,25d,35d,2*^5d",options="header"]
--| |===================================================
--| | VERB       | SYNONYMS | SYNTAX         | A |  M 
--~ +------------+----------+----------------+---+-----+
--| | no         |          | no             | 0 |
--| | what_am_i  |          | what am i      | 0 |
--| | what_is    |          | what is (obj)  | 1 |
--| | where_am_i |          | where am i     | 0 |
--| | where_is   |          | where is (obj) | 1 |
--| | who_am_i   |          | who am i       | 0 |
--| | who_is     |          | who is (act)   | 1 |
--| | yes        |          | yes            | 0 |
--| |===================================================
--<



-- ==============================================================


----- NO


-- ==============================================================


SYNTAX 'no' = 'no'.


VERB 'no'
  CHECK my_game CAN 'no'
    ELSE SAY restricted_response OF my_game.
  DOES "Really?"
END VERB 'no'.



-- ==============================================================


----- WHAT AM I


-- ==============================================================


SYNTAX what_am_i = 'what' am i.


VERB what_am_i
  CHECK my_game CAN what_am_i
    ELSE SAY restricted_response OF my_game.
  DOES
    "Maybe examining yourself might help."
END VERB what_am_i.



-- ==============================================================


----- WHAT IS


-- ==============================================================


SYNTAX what_is = 'what' 'is' (obj)!
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_what_sg OF my_game.
        ELSE SAY illegal_parameter_what_pl OF my_game.
      END IF.

  what_is = 'what' 'are' (obj)!.


ADD TO EVERY THING
  VERB what_is
    CHECK my_game CAN what_is
      ELSE SAY restricted_response OF my_game.
    DOES
      "You'll have to find it out yourself."
  END VERB what_is.
END ADD TO.



-- ==============================================================


----- WHERE AM I


-- ==============================================================


SYNTAX where_am_i = 'where' am i.


VERB where_am_i
  CHECK my_game CAN where_am_i
    ELSE SAY restricted_response OF my_game.
  DOES
    LOOK.
END VERB where_am_i.



-- ==============================================================


----- WHERE IS


-- ==============================================================


SYNTAX where_is = 'where' 'is' (obj)!
  WHERE obj ISA THING
    ELSE
      IF obj IS NOT plural
        THEN SAY illegal_parameter_what_sg OF my_game.
        ELSE SAY illegal_parameter_what_pl OF my_game.
      END IF.

  where_is = 'where' 'are' (obj)!.


ADD TO EVERY THING
  VERB where_is
    CHECK my_game CAN where_is
      ELSE SAY restricted_response OF my_game.
    AND obj NOT AT hero
      ELSE
        IF obj IS NOT plural
          THEN SAY check_obj_not_at_hero_sg OF my_game.
          ELSE SAY check_obj_not_at_hero_pl OF my_game.
        END IF.
    DOES
      "You'll have to find it out yourself."
  END VERB where_is.
END ADD TO.



-- ==============================================================


----- WHO AM I


-- ==============================================================


SYNTAX who_am_i = who am i.


VERB who_am_i
  CHECK my_game CAN who_am_i
    ELSE SAY restricted_response OF my_game.
  DOES
    "Maybe examining yourself might help."
END VERB who_am_i.



-- ==============================================================


----- WHO IS


-- ==============================================================


SYNTAX who_is = 'who' 'is' (act)!
  WHERE act ISA ACTOR
    ELSE
      IF act IS NOT plural
        THEN SAY illegal_parameter_who_sg OF my_game.
        ELSE SAY illegal_parameter_who_pl OF my_game.
      END IF.

        who_is = 'who' 'are' (act)!.


ADD TO EVERY ACTOR
  VERB who_is
    CHECK my_game CAN who_is
      ELSE SAY restricted_response OF my_game.
    DOES
      "You'll have to find it out yourself."
  END VERB who_is.
END ADD TO.



-- ================================================================


----- YES


-- ================================================================


SYNTAX yes = yes.


VERB yes
  CHECK my_game CAN yes
    ELSE SAY restricted_response OF my_game.
  DOES "Really?"
END VERB yes.



-- =============================================================================
-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
-- -----------------------------------------------------------------------------
-- 
-- UNSORTED ..... 
-- 
-- -----------------------------------------------------------------------------
-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
--  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
-- =============================================================================



-->custom_attributes(100)
--| ////
--| ============================================================================
--| Custom AsciiDoc Attributes for Doxter
--| ============================================================================
--| ////

--| // Define substitution of {X} with Unicode character 'heavy check mark'
--| // (U+2714), used in verbs tables:
--| :X: &#x2714;
--<

---< End of File >---
