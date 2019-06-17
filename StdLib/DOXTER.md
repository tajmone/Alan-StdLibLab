# Doxter Annotation

Some work notes on the organization of StdLib documentation in [Doxter] tagged regions.

-----

**Table of Contents**


<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3,4" -->

- [Regions and Weights in The Documentation](#regions-and-weights-in-the-documentation)
    - [Classes](#classes)
    - [Definitions](#definitions)
    - [Locations](#locations)
    - [Library Messages](#library-messages)
    - [Runtime Messages](#runtime-messages)
    - [Verbs](#verbs)
    - [Verbs Restrictions](#verbs-restrictions)

<!-- /MarkdownTOC -->

-----


# Regions and Weights in The Documentation

The following tables annotate the various regions of each library module, ordered by weights, to simplify tracking them during editing. 

In the library sources, the documentation is fragmented in various chunks; each chunk belongs to a tagged region in the final AsciiDoc file.
Each region has a unique tag identifier, and the various fragments belonging to the same regions will be merged together in the final doc.

Doxter allows to mark regions via comments markers, and to assign to each region a weight and a subweight.
In the AsciiDoc output, all regions will be sorted by weight in ascending order.
Subweights are used to sort sub-region fragments before mergeing them into a single region.

This system allow to produce a document in which the various text and code fragments are arbitrarily ordered, regardless of their order of appearance in the source module.

For more details on how to use [Doxter], refer to its documentation.


## Classes

- [`lib_classes.i`](./lib_classes.i)

| weight | subw  | tag  | description |
| -----: | ----: | :--- | :---------- |
|        |       |      |             |

<!-- 
| 00000  |       | `xxxx` | xxxxxxxxxx |
-->

## Definitions

- [`lib_definitions.i`](./lib_definitions.i)

| weight | subw  | tag  | description |
| -----: | ----: | :--- | :---------- |
|        |       |      |             |

<!-- 
| 00000  |       | `xxxx` | xxxxxxxxxx |
-->

## Locations

- [`lib_locations.i`](./lib_locations.i)

| weight | subw  | tag  | description |
| -----: | ----: | :--- | :---------- |
|        |       |      |             |

<!-- 
| 00000  |       | `xxxx` | xxxxxxxxxx |
-->

## Library Messages

- [`lib_messages_library.i`](./lib_messages_library.i)

| weight | subw  | tag  | description |
| -----: | ----: | :--- | :---------- |
|        |       |      |             |

<!-- 
| 00000  |       | `xxxx` | xxxxxxxxxx |
-->

## Runtime Messages

- [`lib_messages_runtime.i`](./lib_messages_runtime.i)

| weight | subw  | tag  | description |
| -----: | ----: | :--- | :---------- |
|        |       |      |             |

<!-- 
| 00000  |       | `xxxx` | xxxxxxxxxx |
-->

## Verbs

- [`lib_verbs.i`](./lib_verbs.i)

| weight | subw  | tag                     | description                               |
| -----: | ----: | :---                    | :----------                               |
| 100    |       | `custom_attributes`     | \[Custom AsciiDoc Attributes for Doxter\] |
| 1000   |       | `verbs_list`            | == List of All Verbs                      |
| 1010   |       | `table_meta_verbs`      | === Table of Meta Verbs                   |
| 1020   |       | `table_game_verbs`      | === Table of Game Commands                |
| 1030   |       | `table_questions_verbs` | === Table of Questions and Answers Verbs  |
| 10000  |       | `meta_verbs`            | == Meta Verbs                             |
| 20000  |       | `game_commands`         | == Game Commands                          |
| 30000  |       | `questions_verbs`       | == Questions and Answers Verbs            |

<!-- 
| 00000  |       | `xxxx` | xxxxxxxxxx |
-->

## Verbs Restrictions

- [`lib_verbs_restrictions.i`](./lib_verbs_restrictions.i)


| weight | subw  | tag  | description |
| -----: | ----: | :--- | :---------- |
|        |       |      |             |

<!-- 
| 00000  |       | `xxxx` | xxxxxxxxxx |
-->


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS                                
------------------------------------------------------------------------------>

[Doxter]: https://github.com/tajmone/doxter "Visita il repository di Doxter su GitHub"

<!-- EOF -->