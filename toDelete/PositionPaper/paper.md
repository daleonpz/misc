# Using Argumentation to Explain Ambiguity in Requirements Elicitation Interviews
## Abstract
- during interviews ambiguities in the dialog discourse may reveal the prescense of tacit knowlegde that needs to be made explicit
- it is important to understand the nature of the  ambiguities and to provide cognitive tools to the analysts to identify and alleviate them
- ambiguities can't be always be explain as a separated term, sometimes the analyst must analyze entire fragments of the speech
- show ambiguities that can be characterized using argumentation theory
- What is argumentation theory? 
- What is an ambiguity?
- What is requirement elicitation? 
- What is tacit knowledge?
- statements are represented as arguments 
- many of the ambiguities can be characterized as "attacks" in the framework of argumentation theory

## Introduction
- The goal of the interviews (most effective technique in requirement elicitation) is to transfer the costumer's knowlegde and need to the analyst, so that information can be conveyed to a requirement document
- The success of the interview depends on several factors, and ambiguities can compromise the knowlegde transfer.
- A detected ambiguity can lead to the discovery of tacit knowledge, which is unexpressed, system-relevant information that needs to be elicited
- Thus, it is important to provide tools to the analysts so they are able to recognize and alleviate the ambiguities.
- we formalise one specific type of ambiguity, namely acceptance unclarity. This phenomenon occurs when the analyst is not able to accept a speech fragment expressed by the customer, either because it is inconsistent with their current understanding of the problem space, or because it is insufficient to comprehend the problem.
- Goal of the paper: provide theory for explaining ambiguities cases that cannot be rooted in single terms
- Use "argumentation theory" as formal tools
- Inspired by "grounded theory": theories are produced in terms of connections among concepts
- it is a Qualitive study:  As with any qualitative study, the current contribution is biased by the background, vision and expectations of the authors. However, we believe that the reported examples provide sufficient evidence of the soundness of our approach

## Background:
###  Ambiguity in Interviews
- information is articulated by means of speech fragments, i.e., any consecutive set of words. 
- Two main phases model the process of understanding of a speech fragment by an analyst:    - Interpretation is the phase in which the analyst gives a meaning to the speech fragment of the customer. 
    - Acceptance is the phase in which the analyst considers whether that meaning is acceptable with respect to their current understanding and knowledge of the problem space.
    -  With the term acceptable we mean that the speech fragment (a) appears sufficiently accurate to comprehend the problem, and (b) the analyst does not register any type of inconsistency with their current understanding of the problem, or
with their knowledge of the domain.
- An acceptance unclarity occurs whenever the analyst 
    - (a) can assign an interpretation to the speech fragment of the customer,
    - (b) the interpretation matches the intended meaning of the customer,
    -  but (c) the interpretation is not acceptable.
 
###  Argumentation
- Argumentation theory [23] is a form of reasoning that makes explicit the reasons for the conclusions that are drawn and how conflicts between reasons are resolved. 
- is a particularly useful tool for the modeling of human dialog and phenomena such as negotiation and debate.
- In its most simple form, the framework is a pair $<A,D>$, where A is a set of arguments, which may be viewed as statements, and D is a set of attacks among those arguments. 
- For example, an argument A1 ∈ A stating that speed will be measured using a laser device can be attacked by another argument A2 ∈ A stating that no laser device may be used. This attack is represented as $(A1,A2) ∈ D$.
- Based on its arguments and attacks, argumentation frameworks enable the determination of which arguments are acceptable (or justified).
- This is performed through the calculation of the so-called extensions of argumentation frameworks.
-  Dung’s machinery is used to determine possible sets of acceptable arguments (AA) by calculating the extensions of AF, denoted by EX(AF). The acceptable arguments are then mapped to outputs (O) through the application of another function (g). 
- Arguments is A = {A1,A2,B1,B2,B3} and the set of attacks is D = {B1 ↔ A2}1. The extensions of AF are then calculated. 
- Intuitively, a grounded extension contains the arguments that are always justified, i.e. it represents the skeptical semantics of argumentation frameworks.
- A preferred extension is a (maximal) set of arguments that
can be collectively accepted. Note that whenever an argume

## Related work
- Ambiguity: 
    - prevention: Rule-based approaches (formal approaches, constrained natural language)
    - innocuous ambiguities: statistical approaches 
    - Related work focus on written texts 
    - Their works: pragmatic ambiguities (depends on the context)
- Inconsistency:
    - usually they are evaluated on the formalized requirement and not on the elicitation phase
- Insufficiency:
    - it is related to the concept of requirement completeness
    - they focus on insufficiency of single fragments of information, not in the sufficiency of the overall information
    
## Conclusion
- oral communication (they think it is more important than written texts) 

#
