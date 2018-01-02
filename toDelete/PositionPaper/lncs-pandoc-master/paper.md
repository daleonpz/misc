---
documentclass: llncs
title: The power of dark silicon
author: Daniel Paredes
institute: FH Dortmund
keywords: hope, luke, ewoks
abstract: | 
    Sit amet mauris. Curabitur a quam. Aliquam neque. Nam nunc nunc,
    lacinia sed, varius quis, iaculis eget, ante. Nulla dictum justo eu lacus.
    Phasellus sit amet quam. Nullam sodales. Cras non magna eu est consectetuer
    faucibus. Donec tempor lobortis turpis. Sed tellus velit, ullamcorper ac,
    fringilla vitae, sodales nec, purus. Morbi aliquet risus in mi.

...


# Introduction
I need an introduction...

# Using Argumentation to Explain Ambiguity in Requirements Elicitation Interviews
One of the major causes of ambiguities in elicitation interviews is the prescense of tacit knowlegde.
In some cases ambiguities can't be always be explained as separated term, sometimes it is required to have a context. 
Even under these circunstances, the analyst must be able to identify and alleviate them in order to elicitate relevant information of the system. 
For this purpose it is necessary to provide the analyst with proper tools.
In this paper Yehia Elrakaiby et al. [@elrakaiby2017using] proposed a theorical framework to overcome ambiguity during interviews in the elicitation phase.
The framework is based on the "Argumentation theory". 

In that sense, Elrakaiby et al. focus on one type of ambiguities, the "acceptance unclarity". 
An acceptance unclarity occurs everytime the analyst is able to assign an interpretation or meaning to the speech fragment of the stakeholder, the interpretation matches the intended meaning of the stakeholder, but the interpretation is not acceptable or justified. 
It could be either because it seems to be inaccurate to comprehend the problem, or analysts identify inconsistencies with their current understanding of the problem or domain knowlegde. 
By using argumentation theory framework, statements and  ambiguities can be characterized as "arguments" and  "attacks" respectevely.

Argumentation theory models a type of human dialog based on arguments and conclusions.
It makes explicit attacks between arguments and the argumentation flow that leads to conclusions.
A basic model in this framework is a pair $(A,D)$, where $A$ is a set of arguments and $D$ is a set of attacks among those arguments. 
For example, a set $A$ is defined as $A = \{A1,A2,A3\}$, and a possible set of attacks could be $D = \{(A1,A3)\}$. 
Which means that if A1 is realizable then A3 can't be realizable.

In the paper, Elrakaiby et al. models statements given by the stakeholders, analysts domain knowlegde and analysts inferences as arguments, and ambiguities between them as attacks.
For example, let say the analyst listens the following statement  _the professor will upload the task description within three days_ (A1), but the analyst know (domain knowlegde) that _the professor may be on a business meeting_ (A2), so the analyst think (inference) that _it may be possible that it will be take longer to upload the task description_ (A3). 
In this scenario the set of attacks $D$ is given by $D = \{(A1,A3)\}$.
Thus, since there is an attack it is possible to ask for clarifications or details.

The theorical framework proposed by Elrakaiby et al. allows analysts to detect and  minimize ambiguities during elicitation interviews, while most of the methods that focus on  ambiguities analyze written texts. 
On the other hand, this framework focuses in more complex ambiguities that cannot be view as single terms.


# Effect of Domain Knowledge on Elicitation Effectiveness: An Internally Replicated Controlled Experiment 
The effectiveness of elicitation interviews may be influenced by analyst skills or characteristics. 
In these high intensive oral communication scenario the analyst must be able to draw out  relevant information and needs from the stakeholders.
It has been reported that the effectiveness of the interviews has a direct relation with the domain knowlegde of the analyst. 
However, there are also studies suggesting that in somecases the domain knowlegde have negatives effects in the effectiveness of interviews.

In this paper [@aranda2016effect], Aranda et al. studied the influence of the analyst domain knowlegde on the effectiveness of elicitation interviews.
The main question they tried to answer was 

_Does analyst domain knowledge influence (either positively or negatively) the effectiveness of the requirements elicitation activity?_


For this purpose, the authors performed the study in two stages. They performed an initial baseline experiment with two domain problems, and then  they performed an internal replication with two other domain problems. 
Furthermore, the authors divided the elicitation process in two phases. 
The elication phase which is the actual interview with the stakeholder, and the reporting phase in which the analyst understands and documents the information gathered in the elication phase. 

One remark of the study is that the authors chose students because of their lack of experience in eliciation interviews, isolation of the domain knowledge,  and to analyze, in the internal replication, the influence of the training in requirements engineering in eliciation interviews. 
In the study participated post-graduated students as interviewers and two professors as interviewees. 
The students should make open interviews and elicitate the information afterwards.
Moreover, for each domain problem the students were separeted in two groups based on their level of domain knowlegde,  _domain-aware_ and _domain-ignorant_. 
On the other hand, the effectiveness of the elicitations was based on the comparison between the number of concepts, processes and requirements elicitated by the students and the benchmarks.

The results of the baseline experiment suggest that the domain knowlegde of the analysts has no significant influence in the effectiveness  of the elicitation interviews.
However, the results also suggest that the domain knowlegde of the interviewees has statistically significant influence.
Supplementary, the results of the internal replication also  suggest that the domain knowlegde of the stakeholders is more relevant than the analysts', in term of effectiveness of the elicitation interviews. 
Nevertheless, these results also show that the possitive effects of the training in requirements engineering of the interviewers, with these effects beiang as relevant as interviwees' domain knowlegde. 


# What i'll do 
 Explain acceptance unclarity
 Explain Dung's framework
 Explain ASPIC+
 Inconsistencies
 It's higly influenced by the domain knowledge of the analyst

## My idea
 knowledge domain has influence
 analyst domain knowledge is statiscally relevant
 analyst training is even more relevant
 influence of tacit knowlegde in interviews

 ambiguity in interviews - focus on interviewer must have domain knowledge 
 what i want to do is : possible beneficts in requirement elicitaiton is usings two techniques based on the domain knowledge of the analyst, sometimes it is good to have an expert and an ignorant of a topic .

 limitations of the technique based on domain knowlegde and tacit knowlegde. 
 how types of tacit knowlegde may influence in the proposal theory
 how domain knowlegde may influence in the proposal theory

 As an intro:
    analyst domain knowledge is statiscally relevant
    analyst training is even more relevant
 focus on the technique from the perspective of knowlegde and technique
 future of that technique to solve more complex problems, from the prospective of knowlegde and technique

<!-- just raw latex --->
\newpage

# References
