# Jacquard Examples

[Jacquard](https://github.com/espertus/jacquard) [[Javadoc](https://ellenspertus.com/jacquard/)]
is a Java autograder for
Gradescope. This repo is for sample graders illustrating how to use Jacquard.

## Video Instructions

For video instructions, see the [Getting started with Jacquard Quiz 1 playlist](
https://northeastern.hosted.panopto.com/Panopto/Pages/Viewer.aspx?pid=c1dee1d0-d598-487f-8067-b06001175c50)
or select individual videos:

1. [Downloading Jacquard examples](https://northeastern.hosted.panopto.com/Panopto/Pages/Viewer.aspx?pid=c1dee1d0-d598-487f-8067-b06001175c50)
   (0:44)
2. [Opening Quiz 1 example in IntelliJ](https://northeastern.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=9d058c84-4bbf-4a23-8ff6-b0600110b1ed)
   (0:54)
3. [Viewing student instructions for Quiz 1](https://northeastern.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=ee302e80-84d0-4015-872c-b0600110b580)
   (1:21)
4. [Viewing starter code and tests (and setting JDK)](https://northeastern.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=a2b356d7-f5dd-4c4f-8b26-b0600110b1b5)
   (2:30)
5. [Viewing main grader code for Quiz 1](https://northeastern.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=885d620b-2728-4fb5-96e5-b06001147c57)
   (5:26)
6. [Running the autograder locally](https://northeastern.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=68d127f1-86ec-4cdc-a110-b06001339b3a)
   (1:46)
7. [Testing and building autograder zip file (Windows)](https://northeastern.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=ee6bc091-4d92-42e5-8eb3-b0600155f875) (
   1:22)
   or [Testing and building autograder zip file (Mac)](https://northeastern.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=6ceb45d9-bf75-4f7d-b7f5-b06501518e45)
   (0:58)
8. [Creating assignment on Gradescope](https://northeastern.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=cd3b672d-5be6-4af4-af18-b0600156675c)
   (0:52)
9. [Uploading and testing autograder](https://northeastern.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=9742091c-558a-46be-8cb4-b06001565d99)
   (2:14)
10. [Refreshing the Jacquard library](https://northeastern.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=8578e267-2bf0-4849-94c0-b066015c1ee3) (
    0:24)

## Examples

There are two examples, both from a CS 2 data structures course. [Quiz 1](quiz1/README.md) should be viewed first.

Quiz 1 demonstrates these features, applied to a single submitted file.

* Checkstyle tests
* PMD tests (using a single rule from a single ruleset)
* Parser-based tests (ensuring that language features are used as required)
* JUnit tests

[Homework 1](homework1/README.md) requires students to complete the implementation
of two classes and write unit tests. It demonstrates these features:

* Checkstyle tests
* PMD tests (using all rules from multiple rulesets)
* Code coverage measurement
* JUnit tests
* Cross-testing, where student-written tests are run against
     * student code
     * a hidden correct implementation
     * a hidden buggy implementation

## FAQ

### How do I make sure I have the latest version of the Jacquard library?

See [Refreshing the Jacquard library](https://northeastern.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=8578e267-2bf0-4849-94c0-b066015c1ee3)
or follow these steps in IntelliJ:

1. Click on `Gradle` in the right sidebar.
2. Right-click (or control-click) on the project name (or the elephant icon to its left).
3. Select `Refresh Gradle Dependencies`.

![screenshot](images/refresh-jar.png)

### How do I use Checkstyle?

See the [Checkstyle website](https://checkstyle.sourceforge.io/),
especially [Checkstyle configuration](https://checkstyle.sourceforge.io/config.html).
For a full example, see [Quiz 1](quiz1/), including
its [configuration file](quiz1/config/checkstyle-rules.xml).
Here is how a Checkstyle grader is created:

```java
CheckstyleGrader checkstyleGrader=new CheckstyleGrader(
        "config/checkstyle-rules.xml", // path to configuration file
        1.0, // penalty per violation
        5.0); // maximum penalty/points
```

We recommend putting your configuration file in your project's `config/`
directory so it is copied to Gradescope. We also recommend sharing it with
students so they can run checkstyle in their
IDE ([IntelliJ plugin](https://plugins.jetbrains.com/plugin/1065-checkstyle-idea),
[Eclipse plugin](https://checkstyle.org/eclipse-cs/#!/))
before uploading. The IntelliJ plugin supports using a local configuration
file or accessing one via URL, so students don't need to download it
(but will need to configure the plugin to point to it).

### What's PMD? How do I use it?
[PMD](https://pmd.github.io/) (which is not an acronym) is a source code analyzer
capable of more complex checks than Checkstyle, such as whether the `@Override`
annotation is always used where permitted.

PMD rules are organized into rulesets, which, as the name suggests, are sets of rules. 
You can [make your own rulesets](https://pmd.github.io/pmd/pmd_userdocs_making_rulesets.htm)
or use [Java rulesets](https://github.com/pmd/pmd/tree/master/pmd-java/src/main/resources)
built in to PMD, such as [`category/java/bestpractices.xml`](https://github.com/pmd/pmd/blob/master/pmd-java/src/main/resources/category/java/bestpractices.xml).

Jacquard's [PMDGrader](https://ellenspertus.com/jacquard/com/spertus/jacquard/pmdgrader/PmdGrader.html)
has two static factory methods:
* [`createFromRuleSetPaths()`](https://ellenspertus.com/jacquard/com/spertus/jacquard/pmdgrader/PmdGrader.html#createFromRuleSetPaths(double,double,java.lang.String...)), 
  which lets you specify one or more rulesets to be used in their entirety [used in [quiz1](hw1/Main.java)]
* [`createFromRules()`]((https://ellenspertus.com/jacquard/com/spertus/jacquard/pmdgrader/PmdGrader.html#createFromRules(double,double,java.lang.String,java.lang.String...))), which lets you specify one ruleset and one or more rules from that ruleset [used in [hw1](hw1/Main.java)]

There are PMD plugins for [IntelliJ](https://plugins.jetbrains.com/plugin/1137-pmd) and [Eclipse](https://marketplace.eclipse.org/category/free-tagging/pmd).

## Support

There are low-volume Google
groups [jacquard-announce](https://groups.google.com/g/jacquard-announce)
and [jacquard-discuss](https://groups.google.com/g/jacquard-discuss).

You can
also [create issues](https://github.com/espertus/jacquard-examples/issues)
(feature requests and bug reports).

[![Javadoc](https://img.shields.io/badge/JavaDoc-Online-green)](https://ellenspertus.com/jacquard/)
