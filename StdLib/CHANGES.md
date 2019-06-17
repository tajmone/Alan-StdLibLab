# Changes List

This document summarizes the changes implemented in this fork of the [ALAN Standard Library].


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Introduction](#introduction)
- [Modularization](#modularization)
    - [Split Modules](#split-modules)
    - [Renamed Modules](#renamed-modules)
- [Self-Documentation](#self-documentation)
- [Code Riorganization](#code-riorganization)
    - [Verbs Grouping](#verbs-grouping)

<!-- /MarkdownTOC -->

-----

# Introduction

This fork is built on top of the upstream StdLib taken from commit [`137b3cc`][137b3cc] — from a development branch for the upcoming v2.2 of the StdLib, which includes various enhancements to the code, especially regarding the clothing system which was rewritten almost from scratch by me, to solve some bugs that had recently surfaced.

Therefore, the original codebase already contained some differences from the latests stable release (v2.1), which might not be listed explicitly here. Furthermore, the upstreadm StdLib doesn't enforce a strict versioning number scheme, so there might be multiple variants of v2.1 circulating.

# Modularization

## Split Modules

In order to reduce the size of individual library modules, some long modules were split into smaller ones:

- `lib_definitions.i`:
    + `lib_messages_library.i` — now contains all the string attributes for library verb responses.
    + `lib_verbs_restrictions.i` — now contains all the code for __Restricted Actions__.

## Renamed Modules

- `lib_messages.i` to `lib_messages_runtime.i` — in order to distinguish between library and runtime messages modules.

# Self-Documentation

All library modules are being adapted to work with [Doxter], a custom tool I've created in order to extract documentation from sources in AsciiDoc format, and produce HTML documents via [Asciidoctor].

# Code Riorganization

Changes in how code inside the  modules is organized aim to simplify editing and studying the Library sources.

## Verbs Grouping

In [`lib_verbs.i`](./lib_verbs.i), all verbs have been riorganized under three distinct groups:

1. Meta Verbs
2. Game Commands
3. Questions and Answers Verbs

The rationale for adopting this approach, instead of the original alphabetical ordering of every verb, is that grouping verbs under these macro categories simplifies sifting through similar types of verbs without having to jump up and down the whole source file. For example, when studying or working on meta-verbs, having them grouped contiguously, and separated from non meta-verbs, is much better.

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

<!-- ALAN Links -->

[ALAN Standard Library]: https://github.com/AnssiR66/AlanStdLib/ "Visit the official repository of the ALAN Standard Library on GitHub"
[Alan Italian]: https://github.com/tajmone/Alan3-Italian "Visit the Alan Italian repository on GitHub"

[Artistic License 2.0]: https://opensource.org/licenses/Artistic-2.0

<!-- 3rd party tools -->

[Doxter]: https://github.com/tajmone/doxter "Visit Doxter repository on GitHub"
[Asciidoctor]: https://asciidoctor.org/ "Visit Asciidoctor website"

<!-- StdLib Commits & Issues -->

[137b3cc]: https://github.com/AnssiR66/AlanStdLib/commit/137b3ccdee33888e8879576d8e6c9dab31af37fe

<!-- people -->

[Anssi Räisänen]: https://github.com/AnssiR66 "View Anssi Räisänen's GitHub profile"
[Tristano Ajmone]: https://github.com/tajmone "View Tristano Ajmone's GitHub profile"

<!-- EOF -->