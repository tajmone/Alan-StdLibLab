# ALAN StdLibLab

- https://github.com/tajmone/Alan-StdLibLab

This project is [Tristano Ajmone]'s personal experimental playground for the [ALAN Standard Library] by [Anssi Räisänen]. It's an unofficial fork for carrying out tests, bugs fixes and enhancements, for personal use.

Creation date: 2019/06/13.

-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Introduction](#introduction)
- [Project Status](#project-status)
- [CodeBase Info](#codebase-info)
- [License](#license)

<!-- /MarkdownTOC -->

-----

# Introduction

Since April 2018 I've been working on the [Alan Italian] project, the Italian translation/port of [Anssi Räisänen]'s ALAN StdLib. During this extended work I had a chance to study in depth Anssi's StdLib, and to contribute to its upstream development with some fixes and improvements.

For the Italian port, I've changed some aspects of the upstream library, either due to language and grammar differences between English and Italian, or because I wanted to tweak the library code and behaviour in slightly different directions.

This project is my personal playground where I test tweaks to the StdLib, in order to experiment new approaches and features — which might be also proposed on the upstream project if they turn out useful, but not necessarily so.

My main goal is to maintain a version of the StdLib which mirrors the changes I've introduced in the Italian Library, so that I have almost identical libraries to create adventures in both Italian and English.

Many of the changes I'll be introducing here reflect my own needs and likings, and some of these changes were rejected on the upstream StdLib project, when proposed, for they'd constitute a divergence from the philosophy of the original project. This also means that the StdLibLab project will eventually end up diverging from its upstream source in a manner that might render cross-integration between the two unmanageable — this being a side-effect of experimentation and exploring new paths, and only time can really tell if this is going to be useful or not.

# Project Status

The StdLibLab will be in Alpha stage until all [known bugs] of the StdLib are fixed, and until all the proposed milestones are implemented.

# CodeBase Info

This project is built on top of the upstream StdLib taken from commit [`137b3cc`][137b3cc] — the latest development branch for the upcoming v2.2 of the StdLib, which includes various enhancements to the code, especially regarding the clothing system which was rewritten almost from scratch by me, to solve some bugs that had recently surfaced.

# License

- [`LICENSE`](./LICENSE)

The Alan Standard Library v2 is © Copyright by [Anssi Räisänen], distributed under the [Artistic License 2.0]. The same license terms apply to this project.


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[ALAN Standard Library]: https://github.com/AnssiR66/AlanStdLib/ "Visit the official repository of the ALAN Standard Library on GitHub"
[Alan Italian]: https://github.com/tajmone/Alan3-Italian "Visit the Alan Italian repository on GitHub"

[Artistic License 2.0]: https://opensource.org/licenses/Artistic-2.0

<!-- repo xrefs -->

[known bugs]: https://github.com/tajmone/Alan-StdLibLab/labels/bug "View list of bugs that need to be fixed"

<!-- StdLib Commits & Issues -->

[137b3cc]: https://github.com/AnssiR66/AlanStdLib/commit/137b3ccdee33888e8879576d8e6c9dab31af37fe

<!-- people -->

[Anssi Räisänen]: https://github.com/AnssiR66 "View Anssi Räisänen's GitHub profile"
[Tristano Ajmone]: https://github.com/tajmone "View Tristano Ajmone's GitHub profile"

<!-- EOF -->