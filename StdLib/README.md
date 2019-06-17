# Alan StdLibLab

Custom fork of the [ALAN Standard Library] by [Anssi Räisänen], maintained by [Tristano Ajmone]. Released under [Artistic License 2.0].


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Folder Contents](#folder-contents)
- [Roadmap](#roadmap)
    - [Further Modularization](#further-modularization)
    - [Consistency in Code Conventions](#consistency-in-code-conventions)
    - [Code Optimization](#code-optimization)
    - [Self-Documentation](#self-documentation)
    - [Bug Fixes](#bug-fixes)
    - [Improvements](#improvements)

<!-- /MarkdownTOC -->

-----

# Folder Contents

- [`library.i`](./library.i) — main library module, imports all others:
    + [`lib_classes.i`](./lib_classes.i)
    + [`lib_definitions.i`](./lib_definitions.i)
    + [`lib_locations.i`](./lib_locations.i)
    + [`lib_messages_library.i`](./lib_messages_library.i) — String attributes for library messages.
    + [`lib_messages_runtime.i`](./lib_messages_runtime.i) — Runtime messages definitions.
    + [`lib_verbs.i`](./lib_verbs.i)
    + [`lib_verbs_restrictions.i`](./lib_verbs_restrictions.i) — Restricted Actions.
- [`DOXTERIZE.bat`](./DOXTERIZE.bat) — Generates StdLib documentation:
    + [`library.html`](./library.html)
    + [`lib_classes.html`](./lib_classes.html)
    + [`lib_definitions.html`](./lib_definitions.html)
    + [`lib_locations.html`](./lib_locations.html)
    + [`lib_messages_library.html`](./lib_messages_library.html)
    + [`lib_messages_runtime.html`](./lib_messages_runtime.html)
    + [`lib_verbs.html`](./lib_verbs.html)
    + [`lib_verbs_restrictions.html`](./lib_verbs_restrictions.html)
- [`DOXTER.md`](./DOXTER.md) — Notes on tagged regions organization.


Based on the StdLib source files from commit [`137b3cc`][137b3cc] of the upstream project.

# Roadmap

The goal of this fork of the [ALAN Standard Library] is to adopt a slightly different approach from its upstream codebase. This section illustrates the roadmap of the changes that will be implemented, with some explanations of my motivations, as well as some status notes.

- [ ]  [Further Modularization].
- [ ]  [Consistency in Code Conventions].
- [ ]  [Code Optimization].
- [ ]  [Self-Documentation].
- [ ]  [Bug Fixes].
- [ ]  [Improvements].

## Further Modularization

Split the library into smaller modules, for this simplifies code maintenance and readability:

- [x] Add `lib_messages_library.i` — move to this module all the string attributes for library messages contained in `lib_definitions.i`.
- [x] Rename `lib_messages.i` to `lib_messages_runtime.i` — just to distinguish between the library messages and the runtime messages modules.
- [x] Add `lib_verbs_restrictions.i` move to this module all the code for __Restricted Actions__ contained in `lib_definitions.i`.
- [ ] Add `lib_classes_clothing.i` — move to this module all the code regarding clothing, because it's long and deserved to be in a module of its own.

There's no reason why different aspects of the library shouldn't be kept each in its own module. Isolating features in standalone source files simplifies greatly maintenance tasks for developers, and it's easier to study for end users too. Regardless of how many modules there are in the library, authors will always need to to `IMPORT` a single file in their adventures.


Another goal would be to make some modules optional (e.g. clothing), so that they can be left out if the author doesn't need them. This is going to be tricky, for Alan doesn't allow conditional inclusion of files, and because the code of most features is spread across multiple modules. But I'll try to find a way to achieve this.

## Consistency in Code Conventions

The StdLib doesn't adopt a strict code convention when it comes to keywords letter-casing and indentation. This fork will enforce a strict convention to simplify search and replace operations on all library source files.

## Code Optimization

Some parts of the library source code can be optimized.

## Self-Documentation

I want to adopt for this fork the same system I've used for the Italian translation of the StdLib, where I used the [Doxter] tool to extract documentation from the source files comments, relying on [Asciidoctor].

This system allows to maintain a self-updating documentation that will always mirror the actual state of the library, both in documentation and examples — examples are compiled during documentation update, as well as their transcripts.

## Bug Fixes


## Improvements

I also want to implement some library improvements that I've added to the Italian library, and which were not accepted on the upstream StdLib.

A major improvement I'd like to add is support for dialogues, possibly via an optional module.

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>


<!-- ALAN Links -->

[ALAN Standard Library]: https://github.com/AnssiR66/AlanStdLib/ "Visit the official repository of the ALAN Standard Library on GitHub"
[Artistic License 2.0]: https://opensource.org/licenses/Artistic-2.0

<!-- 3rd party tools -->

[Doxter]: https://github.com/tajmone/doxter "Visit Doxter repository on GitHub"
[Asciidoctor]: https://asciidoctor.org/ "Visit Asciidoctor website"

<!-- StdLib Commits & Issues -->

[137b3cc]: https://github.com/AnssiR66/AlanStdLib/commit/137b3ccdee33888e8879576d8e6c9dab31af37fe

<!-- people -->

[Anssi Räisänen]: https://github.com/AnssiR66 "View Anssi Räisänen's GitHub profile"
[Tristano Ajmone]: https://github.com/tajmone "View Tristano Ajmone's GitHub profile"

<!-- xrefs -->

[Further Modularization]: #further-modularization
[Consistency in Code Conventions]: #consistency-in-code-conventions
[Code Optimization]: #code-optimization
[Self-Documentation]: #Self-Documentation
[Bug Fixes]: #bug-fixes
[Improvements]: #improvements

<!-- EOF -->