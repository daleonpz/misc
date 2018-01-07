---
documentclass: llncs
title: Influence of tacit knowledge in elicitation interviews 
author: Daniel Paredes
institute: FH Dortmund
keywords: interview, tacit knowledge, elicitation
abstract: |
    Interviews are the most common technique in requirements elicitation. However, the presence of tacit knowledge has an important influence on interview success. In this paper, we describe a tacit knowledge classification. Then, we make use, with examples, of a theoretical framework to detect and minimize the effects of tacit knowledge. Finally, we analyze how likely it is to have a successful elicitation interview based on the tacit knowledge classification. 
...

# Introduction
Requirements engineering is the subset of systems engineering concerned with discovering, developing, tracing, analyzing, qualifying, communicating and managing requirements that define the system at successive levels of abstraction [@dick2017requirements]. 
The first step of requirements engineering is requirements elicitation which is defined as the process of finding and formulating requirements [@lauesen2001softwarereq], and this process has many barriers due to the fact that stakeholders are not able to express their needs, explain what they do and why, conflicting demands, or new demands once other are met, just to mention some examples.

One of the most used techniques to elicit requirements is open interviews, and also it is considered the most effective way to transfer domain knowledge [@elrakaiby2017using]. 
However, the success of interviews depends on mainly two factors, analyst's set of interviewing skills and stakeholders' domain knowledge; nonetheless, statistically analyst's domain knowledge is important but not as relevant as the other two[@aranda2016effect].
Therefore, the analyst depends on the use of tools and techniques to detect and elicit tacit knowledge form stakeholders. Tacit knowledge in requirements engineering is defined as the knowledge that a stakeholders has, but does not pass to the requirements analyst [@ferrari2015ambiguity].

In this paper, we describe a classification of tacit knowledge in elicitation interviews based on [@sutcliffe2013requirements]. Then we apply the theoretical framework described in [@elrakaiby2017using] to examples to show how to deal with tacit knowledge. The examples were selected in order to analyze each scenario of the classification. Finally, 
we use the result from [@aranda2016effect] to identify in which scenario  a successful interview is most likely to occur. 

The remainder of the paper is structured as follows. In section 2 we provide a summary of the papers used to write this paper. In section 3 we present our approach. Finally, in section 4, we present our conclusions. 

# Background 
## Requirements elicitation: Towards the Unknown Unknowns [@sutcliffe2013requirements]
Elicitation in requirements engineering is still problematic because missing or mistaken requirements are hard to elicit, and this produces projects delays and has financial implications. 
In this paper, the authors propose an elicitation review framework (ERF) in order to explore the different challenges related to the "unknowness" of the domain knowledge.
Therefore, proposing a road map of research to tackle the different levels of the "unknowness".

The authors made use of the properties of _expressible_ (known knowledge), _articulated_ (documented domain knowledge), _accessible_ (need memory recall), _relevant_ (to the project).
With these four properties, authors defined  the following levels of unknowness in domain knowledge.

  * Known knowns: knowledge that is expressible, articulated, and relevant. 
  * Known unknowns: knowledge that is not expressible or articulated, but accessible and potentially relevant. 
  * Unknown knowns: knowledge that is potentially accessible but not articulated. 
  * Unknown unknowns: knowledge that is not expressible, articulated nor accessible but may be relevant.  

<!--
This levels of knowledge implies problems from different perspective in the elicitation process that involves analysts and stakeholders. 
The _known knowns_ is a simple scenario  since the counterparts are aware of the domain problem which is expressible and  articulated. 
In the case of the  _known unknowns_, the analysts has a domain knowledge and they  should be able draw out the information from the stakeholders that they might be unaware of.
In contrast, in the _unknown knowns_ scenario the stakeholders are the ones that are aware of the domain knowledge but for some reason it is no articulated, and therefore, the analysts once they notice any glimpse of the stakeholders information they should able to discover and elicit that.
On the other hand, in the case of _unknown unknowns_ both counterparts are unaware of the missing information that might be relevant to the system. 
-->

Based on the perspectives described before, the authors identified three challenges to requirement elicitation. The first one is to identify tacit knowledge (unknown knowns),  even in the case the analyst presumes it exist (known unknowns).
The second challenge is that the analyst should know what is relevant and should be articulated.
And the last one is the articulation of the knowledge.
Thus, in the worst case scenario the goal is to go from the unknown unknowns perspective to known knowns.

Finally, the authors suggest four research directions to deal with the unknowness problem. 
First, in _known unknown_ the analyst should challenge assumptions, implications, and relax domain constrains in order to increase the probability of eliciting the unaware knowledge of the stakeholders.
In the same direction, the _design discovery_, which is a variant of the latter case, the analyst should deal with the the following statement: "I'll know what I want when I see it". Thus, there is a need for prototyping or simulating as part of the elicitation process. 
In the case of the _unknown knowns_, the analyst can elicit tacit knowledge by taking into account the background (political, cultural, emotional) of stakeholders, and use that background as an "emotional guidance" in order to draw out the relevant information.
Finally, in order to deal with  _unknown unknowns_, the authors suggest two main approaches. The first one is based on the "over-the-horizon" knowledge which  is a socio-technical approach based on social media and e-communities. And the other one is based on counter examples that can challenge the boundaries of the idea under development. 


## Using Argumentation to Explain Ambiguity in Requirements Elicitation Interviews [@elrakaiby2017using]
One of the major causes of ambiguities in elicitation interviews is the presence of tacit knowledge.
In some cases, ambiguities can't be explained as separated terms, sometimes it is required to have a context. 
Even under these circumstances, the analyst must be able to identify and alleviate them in order to elicit relevant information of the system. 
For this purpose, it is necessary to provide the analyst with proper tools.
In this paper, Yehia Elrakaiby et al. proposed a theoretical framework to overcome ambiguity during interviews in the elicitation phase.
The framework is based on the "Argumentation theory". 

In that sense, the authors focus on one type of ambiguities, the "acceptance unclarity". 
An acceptance unclarity occurs every time the analyst is able to assign an interpretation or meaning to the speech fragment of the stakeholder, the interpretation matches the intended meaning of the stakeholder, but the interpretation is not acceptable or justified. 
It could be either because it seems to be inaccurate to comprehend the problem, or analysts identify inconsistencies with their current understanding of the problem or domain knowledge. 
By using argumentation theory framework, statements and  ambiguities can be characterized as "arguments" and  "attacks" respectively.

Argumentation theory models a type of human dialog based on arguments and conclusions.
It makes explicit attacks between arguments and the argumentation flow that leads to conclusions.
A basic model in this framework is a pair $(A,D)$, where $A$ is a set of arguments and $D$ is a set of attacks among those arguments. 
For example, a set $A$ could be defined as $A = \{A1,A2,A3\}$, and a possible set of attacks could be $D = \{(A1,A3)\}$. 
Which means that if A1 is realizable then A3 can't be realizable.

In the paper, statements given by the stakeholders, analysts' domain knowledge and analysts' inferences are modeled as arguments, and ambiguities between them as attacks.
For example, let's say the analyst listens to the following statement:  _the professor will upload the task description within three days_ (A1), but the analyst knows (domain knowledge) that _the professor may be on a business meeting_ (A2), so the analyst thinks (inference) that _it may be possible that it will be take longer to upload the task description_ (A3). 
In this scenario the set of attacks $D$ is given by $D = \{(A1,A3)\}$.
Thus, since there is an attack it is possible to ask for clarifications.

The theoretical framework proposed allows analysts to detect and  minimize ambiguities during elicitation interviews, while most of the methods focus on  ambiguities analysis in  written texts. 
On the other hand, this framework focuses in more complex ambiguities that cannot be view as single terms.


## Effect of Domain Knowledge on Elicitation Effectiveness: An Internally Replicated Controlled Experiment  [@aranda2016effect]
The effectiveness of elicitation interviews may be influenced by analyst skills or characteristics. 
In this high intensive oral communication scenario the analyst must be able to draw out  relevant information and needs from the stakeholders.
It has been reported that the effectiveness of the interviews has a direct relation with the domain knowledge of the analyst. 
However, there are also studies suggesting that in some cases the domain knowledge have negatives effects in the effectiveness of interviews.

In this paper, Aranda et al. studied the influence of the analyst domain knowledge on the effectiveness of elicitation interviews.
The main question they tried to answer was 

> _Does analyst domain knowledge influence (either positively or negatively) the effectiveness of the requirements elicitation activity?_


For this purpose, the authors performed the study in two stages. They performed an initial baseline experiment with two domain problems, and then  they performed an internal replication with two other domain problems. 
<!--Furthermore, the authors divided the elicitation process in two phases. 
The elicitation phase which is the actual interview with the stakeholder, and the reporting phase in which the analyst understands and documents the information gathered in the elicitation phase. 
-->
One remark of the study is that the authors chose students because of their lack of experience in elicitation interviews, isolation of the domain knowledge,  and to analyze, in the internal replication, the influence of the training in requirements engineering in elicitation interviews. 
In the study, post-graduated students participated as interviewers and two professors as interviewees. 
The students had make open interviews and elicit the information afterwards.
Moreover, for each domain problem the students were separated in two groups based on their level of domain knowledge,  _domain-aware_ and _domain-ignorant_. 
On the other hand, the effectiveness of the elicitation was based on the comparison between the number of concepts, processes and requirements elicited by the students and the benchmarks.

The results of the baseline experiment suggest that the domain knowledge of the analysts has no significant influence in the effectiveness  of the elicitation interviews.
However, the results also suggest that the domain knowledge of the interviewees has statistically significant influence.
Supplementarily, the results of the internal replication also  suggest that the domain knowledge of the stakeholders is more relevant than the analysts', in terms of effectiveness of elicitation interviews. 
Nevertheless, these results also show the positive effects of the training in requirements engineering of the interviewers, with these effects being as relevant as interviewees' domain knowledge. 

# Tacit knowledge in elicitation interviews 
## Types of tacit knowledge
Many analysts consider interviews the most important elicitation technique, and usually the elicitation process starts with interviewing the stakeholders. 
Interviews allow analysts to check their understanding about the problem domain immediately and ask for clarifications.
Moreover, this technique is versatile in the sense of being possible that new and unexpected issues come up and be attacked at that moment.

However, eliciting tacit knowledge in interviews is still a hard task to do. 
This tacit knowledge  can be classified in four groups as described in [@sutcliffe2013requirements].
The **known knowns**, **known unknowns**, **unknown knowns** and **unknown unknowns**.
The  _known knowns_ is the knowledge that is documented, expressible, and relevant to the system. In other words, it is the scenario in which it is possible to elicit from the beginning all the requirements, there is no tacit knowledge.
The _known unknowns_ is the knowledge that cannot be expressible because the stakeholders are not aware of their lack of domain knowledge,  they might forget it. In this case, analyst are aware of the domain knowledge and therefore, their job is to challenge assumptions or implications in order to elicit information that stakeholders are unaware of.
The _unknown knowns_ is the knowledge that stakeholders hold but it is not documented by some reason.  Thus, analysts should use their interviewing skill to elicit when they spot any glimpse of that knowledge.
The _unknown unknowns_ is the knowledge that neither the analysts nor stakeholders are aware of, but might be relevant to the project. 

## How to deal with tacit knowledge 
The unknowness clarification presented in above suggests the presence of three problems.
The goal is to go from any scenario in which tacit knowledge exists to known knowns. 
In order to achieve that goal and take the advantages presented in elicitation interviews (immediate clarification of assumptions and debate of implications) we are going to use the theoretical  framework described by Elrakaiby [@elrakaiby2017using].
In this framework we model the interview as a set of arguments and attacks between them.
In that sense, we will be able to spot ambiguities and tacit knowledge in terms of inconsistencies and insufficiency of information. 
We will adapt some examples from [@elrakaiby2017using] to show how each tacit knowledge scenario can be addresed. 

**known unknowns**: In the following example, the domain knowledge of the analyst is used to detect inconsistencies (attacks), because the stakeholder didn't take into account relevant information about domain application (location of trash bins).

A customer wanted a recycling-support system and one of the goals was _to avoid fines from the municipality for incorrect recycling_.  According to the domain knowledge of the analyst, _trash bins are placed along the streets_.  Thus, the goal was inconsistent with the domain knowledge of the analyst because _there is no way to trace back person who brakes the recycling rule_. 
This scenario can be modeled using arguments and attacks as follows:

The arguments: (A1)trash bins are placed along the streets, (A2)since trash bins are placed along the streets, the trash owner cannot be traced back. (B1)people who do not recycle should be fined (B2)to fine people, the municipality must be able to trace products in trash bins back to their owners.

Attacks: A2 attacks B1, and vice versa.

**unknown knowns**: In the following example, analyst challenges the stakeholder's statement, as a result, the stakeholder reveals new information (reply). 

A customer wants to develop a system to allow patients to measure the amount of glucose in their blood, and then send the result to their general practitioner. If the glucose level is above a certain threshold, the practitioner pays a visit to the patient.
The customer said: _in one-two days the doctor sees the notification in the system_. Then the analyst asked:  _What happens if the doctor is not available for any reason?_. The customer replied: _The general practitioner is substituted by another doctor who accesses the same system_.

The arguments: (A1)in one-two days the doctor sees the notification,(B1)the doctor might be unavailable,(B2)since the the doctor might be unavailable, the notification might be  delayed.

The attacks: A1 attacks B2, and vice versa 

**unknown unknowns**: In the following example the stakeholder didn't notice the inconsistency between his statements, but the analyst did and asked for clarification. However, the stakeholder couldn't give an answer due to his ignorance.

One of the customers wants to develop an app to manage medical-related reservation in Tuscani. The costumer mentioned that the  _current reservation system, based on phone calls, was centralized_. During the interview,  the customer said that _depending on where the examination/visit will be, the patient has to call Nottola or Siena_. The analyst could not understand how this realization was possible since it means the reservation system is not centralized. Therefore the analyst asked for clarification and the stakeholder couldn't give any acceptable answer.

The arguments: (A1)the current reservation is centralized, (B1)depending on where the examination/visit will be (B2)the patience has to call Nottola or Siena, (B3) since it is possible to call either Nottola or Siena the system is not centralized.

The attacks: A1 attacks B3, and vice versa

## Limits of elicited knowledge
In the last section we present how to use a theoretical framework based on arguments and attacks to be addressed the different levels of tacit knowledge.
In this section we will compare in which scenario of tacit knowledge the elicitation interview would be more effective based on Aranda et al. work [@aranda2016effect] about the effect of domain knowledge on elicitation process.   
Effectiveness is described in [@aranda2016effect] as the total percentage of problem domain elements identified compared to a benchmark. 
However, since we have no access to any requirement data, we will use the results from [@aranda2016effect] to compare the different scenarios of tacit knowledge (known unknowns, unknown knowns and unknowns unknowns).

The work presented in [@aranda2016effect] concludes that: (1)analyst's domain knowledge(ADK) has small but statistically significant effect on the effectiveness, (2)stakeholders' domain knowledge(SDK) has a big positive and significant influence and (3)analyst's interviewing skill and general training in requirement activities have also a big positive and significant influence. 
In this paper, we will focus only in the comparison between scenarios of tacit knowledge  based on the domain knowledge holder since that knowledge can be measured.

| scenario              | ADK | SDK |
|:----------------------|:---:|:---:|
| known unknowns        | $+$ | 0   |
| unknown knowns        | 0   |$++$ |
| unknown unknowns      | 0   | 0   |

Table: Influence of domain knowledge in the different tacit knowledge scenarios

We can observe in Table 1 that it is more likely to be effective in the scenario of _unknown knowns_ because the stakeholders' domain knowledge has more influence than analyst's domain knowledge. 
On the other hand, the analyst's interviewing skills will have different approaches in the case of _known unknowns_ and _unknown knowns_. In the first case, the interview will be more focused on challenging assumptions and implications, and in the latter case on spotting glimpses of stakeholders' hidden knowledge.

# Conclusions
Elicitation interviews are not an easy task. Like in any intensive oral communication, there are misunderstandings related to tacit knowledge. 
In our work we focus on analyzing the different levels of how tacit knowledge[@sutcliffe2013requirements] would affect the effectiveness of elicitation interviews. 
Moreover, we use the theoretical framework described in [@elrakaiby2017using] to identify and manage tacit knowledge during interviews.
And finally, we analyze, based on the results of [@aranda2016effect], which scenario of tacit knowledge is more likely to have a successful elicitation interview. 


<!--- 
# What i'll do 
Explain tacit knowledge
explain domain knowledge
 Explain acceptance unclarity
 Explain Dung's framework
 Explain ASPIC+
 Inconsistencies
 It's highly influenced by the domain knowledge of the analyst
-->

<!-- just raw latex -->
<!-- \newpage -->

# References
