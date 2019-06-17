--= Alan StdLib Fork: Main Module
--| Tristano Ajmone <tajmone@gmail.com>
--~-----------------------------------------------------------------------------
--~ "library.i"
--| 2019-06-17: Alan 3.0beta6 build 1980
--|=============================================================================
--| Adaptation of the `library.i` module, taken from
--| _ALAN Standard Library_ v2.1, (C) Anssi Räisänen, Artistic License 2.0.
--| Edited by Tristano Ajmone,  (C) 2019, Artistic License 2.0.
--|=============================================================================



--| Import the whole library:


IMPORT 'lib_classes.i'.
IMPORT 'lib_definitions.i'.
IMPORT 'lib_locations.i'.
IMPORT 'lib_messages_runtime.i'.    -- renamed    <- 'lib_messages.i'
IMPORT 'lib_messages_library.i'.    -- taken from <- 'lib_definitions.i'
IMPORT 'lib_verbs.i'.
IMPORT 'lib_verbs_restrictions.i'.  -- taken from <- 'lib_definitions.i'

---< End of File >---
