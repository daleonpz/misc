---
documentclass: llncs
title: I need a title 
author: Daniel Paredes
institute: FH Dortmund
keywords: I, need, keywords
abstract: |
    I need an abstract 

...


# Introduction
I need an introduction...

# Unknowness
Requirements elicitation is the process of finding and formulation requirements, and this process has many barriers due to stakeholders are not able to express their needs, explain what they do and why, conflicting demands, or new demands once other are met[@lauesen2001softwarereq], just to mention some examples.
Many analyst consider interviews the most important elicitation technique, and usually elicitation process starts with interviewing the stakeholders. 
Interviews allow analysts to check their understanding about the problem domain inmediately and ask for clarifications.
Moreover, this technique is versatile in the sense of it is possible that new and unexpected issues come up and they can be attacked at that moment.

However, elicit tacit knowledge in interviews is still a hard task to do. 
This tacit knowledge  can be classified in four groups as describe in [@sutcliffe2013requirements].
The **known knowns**, **known unknowns**, **unknown knowns** and **unknown unknowns**.
The  known knowns is the knowledge that is documented, expressible, and relevant to the system. In order words, is the scenario in which it is possible to elicit since the beginning all the requirements, there is no tacit knowledge.
The known unknowns is the knowledge that cannot be expressible because the stakeholders are not aware of their lack of domain knowledge,  their might forget it. In this case analyst are aware of the domain knowledge and therefore, their job is to challenge assumptions or implications.
The unknown knowns is the knowledge that stakeholders hold but it is not documented by some reason.  Thus, analysts should use their interviewing skill to elicit when they spot any glimpse of that knowledge.
The unknown unknowns is the knowledge that neither the analysts nor stakeholders are aware. 


# Using Argumentation to Explain Ambiguity in Requirements Elicitation Interviews
One of the major causes of ambiguities in elicitation interviews is the presence of tacit knowledge.
In some cases ambiguities can't be always be explained as separated term, sometimes it is required to have a context. 
Even under these circumstances, the analyst must be able to identify and alleviate them in order to elicit relevant information of the system. 
For this purpose it is necessary to provide the analyst with proper tools.
In this paper Yehia Elrakaiby et al. [@elrakaiby2017using] proposed a theoretical framework to overcome ambiguity during interviews in the elicitation phase.
The framework is based on the "Argumentation theory". 

In that sense, Elrakaiby et al. focus on one type of ambiguities, the "acceptance unclarity". 
An acceptance unclarity occurs every time the analyst is able to assign an interpretation or meaning to the speech fragment of the stakeholder, the interpretation matches the intended meaning of the stakeholder, but the interpretation is not acceptable or justified. 
It could be either because it seems to be inaccurate to comprehend the problem, or analysts identify inconsistencies with their current understanding of the problem or domain knowledge. 
By using argumentation theory framework, statements and  ambiguities can be characterized as "arguments" and  "attacks" respectively.

Argumentation theory models a type of human dialog based on arguments and conclusions.
It makes explicit attacks between arguments and the argumentation flow that leads to conclusions.
A basic model in this framework is a pair $(A,D)$, where $A$ is a set of arguments and $D$ is a set of attacks among those arguments. 
For example, a set $A$ is defined as $A = \{A1,A2,A3\}$, and a possible set of attacks could be $D = \{(A1,A3)\}$. 
Which means that if A1 is realizable then A3 can't be realizable.

In the paper, Elrakaiby et al. models statements given by the stakeholders, analysts domain knowledge and analysts inferences as arguments, and ambiguities between them as attacks.
For example, let say the analyst listens the following statement  _the professor will upload the task description within three days_ (A1), but the analyst know (domain knowledge) that _the professor may be on a business meeting_ (A2), so the analyst think (inference) that _it may be possible that it will be take longer to upload the task description_ (A3). 
In this scenario the set of attacks $D$ is given by $D = \{(A1,A3)\}$.
Thus, since there is an attack it is possible to ask for clarifications or details.

The theoretical framework proposed by Elrakaiby et al. allows analysts to detect and  minimize ambiguities during elicitation interviews, while most of the methods that focus on  ambiguities analyze written texts. 
On the other hand, this framework focuses in more complex ambiguities that cannot be view as single terms.


# Effect of Domain Knowledge on Elicitation Effectiveness: An Internally Replicated Controlled Experiment 
The effectiveness of elicitation interviews may be influenced by analyst skills or characteristics. 
In these high intensive oral communication scenario the analyst must be able to draw out  relevant information and needs from the stakeholders.
It has been reported that the effectiveness of the interviews has a direct relation with the domain knowledge of the analyst. 
However, there are also studies suggesting that in some cases the domain knowledge have negatives effects in the effectiveness of interviews.

In this paper [@aranda2016effect], Aranda et al. studied the influence of the analyst domain knowledge on the effectiveness of elicitation interviews.
The main question they tried to answer was 

_Does analyst domain knowledge influence (either positively or negatively) the effectiveness of the requirements elicitation activity?_


For this purpose, the authors performed the study in two stages. They performed an initial baseline experiment with two domain problems, and then  they performed an internal replication with two other domain problems. 
Furthermore, the authors divided the elicitation process in two phases. 
The elicitation phase which is the actual interview with the stakeholder, and the reporting phase in which the analyst understands and documents the information gathered in the elicitation phase. 

One remark of the study is that the authors chose students because of their lack of experience in elicitation interviews, isolation of the domain knowledge,  and to analyze, in the internal replication, the influence of the training in requirements engineering in elicitation interviews. 
In the study participated post-graduated students as interviewers and two professors as interviewees. 
The students should make open interviews and elicit the information afterwards.
Moreover, for each domain problem the students were separated in two groups based on their level of domain knowledge,  _domain-aware_ and _domain-ignorant_. 
On the other hand, the effectiveness of the elicitation's was based on the comparison between the number of concepts, processes and requirements elicited by the students and the benchmarks.

The results of the baseline experiment suggest that the domain knowledge of the analysts has no significant influence in the effectiveness  of the elicitation interviews.
However, the results also suggest that the domain knowledge of the interviewees has statistically significant influence.
Supplementary, the results of the internal replication also  suggest that the domain knowledge of the stakeholders is more relevant than the analysts', in term of effectiveness of the elicitation interviews. 
Nevertheless, these results also show that the positive effects of the training in requirements engineering of the interviewers, with these effects being as relevant as interviewees' domain knowledge. 


# Requirements elicitation: Towards the Unknown Unknowns 
Elicitation in requirements engineering is still problematic because missing or mistaken requirements are hard to elicit, and this produce projects delays and have financial implications. 
In this paper, the authors propose an elicitation review framework (ERF) in order to explore the different challenges related to the "unknowness" of the domain knowledge.
Therefore, proposing a road map of research to tackle the different levels of the "unknowness".

The authors made use of the properties of _expressible_ (known knowledge), _articulated_ (documented domain knowledge), _accessible_ (need memory recall), _relevant_ (to the project).
With these four properties, authors defined  the following levels of unknowness in domain knowledge.

  * Known knowns: knowledge that is expressible, articulated, and relevant. 
  * Known unknowns: knowledge that is not expressible or articulated, but accessible and potentially relevant. 
  * Unknown knowns: knowledge that is potentially accessible but not articulated. 
  * Unknown unknowns: knowledge that is not expressible, articulated nor accessible but may be relevant.  

This levels of knowledge implies problems of different perspective of the elicitation process that involves analysts and stakeholders. 
The _known knowns_ is a simple scenario  since the counterparts are aware of the domain problem which is expressible and  articulated. 
In the case of the  _known unknowns_, the analysts has a domain knowledge and they  should be able draw out the information from the stakeholders that they might be unaware of.
In contrast, in the _unknown knowns_ scenario the stakeholders are the ones that are aware of the domain knowledge but for some reason it is no articulated, and therefore, the analysts once they notice any glimpse of the stakeholders information they should able to discover and elicit that.
On the other hand, in the case of _unknown unknowns_ both counterparts are unaware of the missing information that might be relevant to the system. 


Based on the perspectives described before, the authors identified three challenges to requirement elicitation. The first one is to identifying tacit knowledge (unknown knowns),  even in the case the analyst presume it exist (known unknowns).
The second challenge is that the analyst should know what is relevant and should be articulated.
And the last one is the articulation of the knowledge.
Thus, in the worst case scenario the goal is go from the unknown unknowns perspective to known knowns.

Finally, the authors suggest four research directions to deal with the unknowness problem. 
Starting with the known unknown in which the analyst should challenging assumptions, implications, and relaxing domain constrains in order to increase the probability to elicit the unaware knowledge of the stakeholders.
In the same direction, in the design discovery, which is a variant of the latter case, the analyst should deal with the the following statement "I'll know what I want when I see it". Thus, there is a need of prototyping or simulations as part of the elicitation process. 
In the case of the unknown knowns in which the analyst can elicit tacit knowledge by taking into account the background (political, cultural, emotional) of stakeholders, and use that background as an "emotional guidance" in order to draw out the relevant information.
Finally, in the case of unknown unknowns the authors suggest to main approaches. The first one is based on the "over-the-horizon" knowledge, in which authors proposed a socio-technical approach based on social media and e-communities. And the other one is using counter examples that can challenges the boundaries of the idea under development. 


# Conclusions
I need some conclusions
 
# What i'll do 
Explain tacit knowledge
explain domain knowledge
 Explain acceptance unclarity
 Explain Dung's framework
 Explain ASPIC+
 Inconsistencies
 It's highly influenced by the domain knowledge of the analyst

<!-- just raw latex --->
\newpage

# References
