---
title: "State of Billing UX Research"
date: 2020-01-15
type: Project
draft: true
company: IBM Cloud (Billing & Cost Management)
timeline: Oct 2019 – Jan 2020
role: Project Design Lead
collaborators: Kristin Holifield, Hannah Moyers
---

![Cover](/images/sob/cover.jpg)

<div class="emphasis">

#### Project significance
Insights from this effort were used to align the organization around core issues our platform billing users were facing; many costing us millions per month to support.

</div>

## Background

I had just joined the IBM Cloud Billing & Cost Management team as the new Design Lead. Most of the existing team (Product Manager, Developers, Designers, and Research) had only been on the team for a couple of months; heavily focused on feature-driven projects.

We immediately found billing to be complex, and that we would not be able to solve our user's biggest pain points without focusing on the root causes. The experience had a dangerously low Net Promoter Score (NPS), System Usability Score (SUS), and we were struggling to retain some of our biggest clients.

### It quickly became clear that there were many problems with the billing experience, <span class="accent">but we didn't know where to start.</span>

---

## Project Overview

Our group came together to identify the risks associated with not having a clear understanding of our user base, and outline a project roadmap that would remedy this.

### Goal

Build an understanding of the IBM Cloud Billing & Cost Management experience, our users and their goals. Translate findings into actionable insights we can use to align the team around future projects.

### Design Objectives

- **Identify user archetype(s)** — Methodology: Interviews, Surveys
- **Identify user Jobs to Be Done (Goals)** — Methodology: Interviews, Surveys, Journey Mapping
- **Identify pain points and opportunities** — Methodology: As-is Audit, Heuristic Evaluation, NPS, SUS, Interviews, Surveys

### Deliverables

Team, stakeholder and VP alignment on biggest opportunity areas; use findings to create roadmap and prioritize projects for the upcoming year.

- Alignment presentation & artifact
- Interview synthesis
- Revised archetype
- Jobs to be Done
- Actionable pain point themes
- Opportunity sketches

---

## As-is Audit

To better understand the existing experience, we began by taking an inventory of IBM Cloud Billing & Cost Management UI. Through the process of IA and User Journey Mapping we discovered that the experience was bloated and riddled with many redundancies.

- 8 unique pages, with sub-pages and tabs within
- Multiple pages with redundant functionality
- Unclear page names and taxonomy
- Certain pages only useful to users on a specific billing system (unbeknownst to them)
- Some functionality broken (from years of fusing multiple billing experiences together)

![IA Mapping](/images/sob/ia-mapping.jpg)

---

## Heuristic Evaluation

Alongside the initial IA & Journey Mapping we also conducted a heuristic analysis of the experience using the Nielson Norman Group's [10 Usability Heuristics for User Interface Design](https://www.nngroup.com/articles/ten-usability-heuristics/) framework.

For each of the 10 heuristic principals in the framework we assigned ourselves a compliance score of Poor, Pass, or Exceeds. Needless to say we scored Poor on all 10.

![Heuristic Evaluation](/images/sob/heuristics.jpg)

---

## Interviews & User Feedback

A primary objective of this project was to build a genuine understanding of our customer's needs and pain points. To accomplish this we knew we needed to speak directly with actual users of our product.

We started by gathering feedback obtained over the last year via NPS & Usabilla. As a part of this initial feedback gathering, we also interviewed internal Client Success Managers and Support Representatives, who were able to provide detailed insights on issues our highest spending customers face.

We then worked with our UX Researcher to both craft a survey to send to existing customers, and conduct interviews with over 60 end-users.

![Interviews](/images/sob/interviews.jpg)

Upon completion of the initial experience audit, journey mapping and interviews, we took time to synthesize our findings into a few specific outcomes. Overall we identified 100+ individual pain points our users were facing.

- A revised user archetype
- 6 Initial Jobs to Be Done (+ job steps)
- 5 actionable pain point themes

![Synthesis](/images/sob/synthesis.jpg)

---

## With the initial research complete, what did we find?

---

## User Archetypes

Going into our interviews, we had an idea of a single archetypal billing user: someone who typically worked in the finance department, was largely non-technical and spent most of their time managing their organization's payments and invoices.

While that user archetype proved to be true in many scenarios, it wasn't always the case. We found that many billing users were actually quite technical, able to dig into usage specifics and make optimizations to control spending. There were also users who sat within their org's operations teams connecting their development and finance teams together.

![Archetype](/images/sob/archetype.jpg)

While the end-goals of these different user archetypes largely remain the same, understanding the nuances of each helped us better identify their individual needs and new opportunity areas.

## Jobs to Be Done

To better align the greater team around our user's most common goals, we took our research findings and drafted JTBD statements for the IBM Cloud Billing user.

Initial Jobs to Be Done:

- Kickoff a project on cloud
- Setup account(s)
- Pay for what I use
- Monitor & Optimize my spending
- Forecast costs
- Manage vendor relationships

With each job we captured the steps a typical user takes to complete it (job step), along with measurable needs, and key pain points. Doing this exercise made it easier for us to work with our stakeholders to prioritize projects around end-user outcomes as opposed to features.

![Jobs to Be Done](/images/sob/jtbd.jpg)

---

## Pain Point Themes

We synthesized the 100+ pain points identified in our interview sessions and experience audit into 5 actionable themes we could use to align the team.

#### Ultimately, we were <span class="accent">at risk of losing our customers</span> because...

### Billing periods are inconsistent & confusing

Because IBM Cloud utilizes multiple billing systems, understanding how and when you will be billed for resources and usage is extremely difficult. Users expect to be invoiced on a regular, repeatable cadence at a minimum. Industry best practices have set an expectation that this will be once a month.

> "I see Baremetal servers that were billed in June. And then I see a monthly June usage. So right away that's a bit confusing. I'm thinking about telephone bills and energy bills. It's by month, so it's not by month plus." — CTO, SMB

<div class="emphasis">

#### Related Pain Points
- Cannot easily map usage or spending to a single month
- Billing periods inconsistent with industry standards
- Users can receive multiple different invoices per month
- Usage page filters do not map to billing periods  

</div>

### Reconciling invoices is hard

When users attempt to reconcile or balance their spending, it's almost impossible to compare usage displayed in our UI to what's listed on their invoice. For some of our largest clients, this can mean breaking down monthly costs of $1-3 million by clicking in and out of 30-75 line items and then trying to cross-reference the invoice against our portal without proper reference points.

- 22% of all IaaS NPS comments referenced problems reconciling invoices
- ~$1M/month of support costs were invoice related

> "You could be billing me for something that I shouldn't be billed for or not billing me for something I should be billed for, but I can't possibly cross reference this because there's no way for me to figure it out." — Cloud Ops Coordinator, Enterprise

<div class="emphasis">

#### Related Pain Points
- Invoices not granular enough - multiple items rolled into one overarching reference
- Cannot map items on invoice back to Usage dashboard in the Cloud UI
- Some invoices list all items as $0, even when they’re not
- User’s must open each $0 line item to confirm it’s actually $0
- Users receive multiple $0 invoices for services added but not in use

</div>

### Invoicing can be delayed

Depending on the resource used, account type, and billing system, a user might not be invoiced for their services until 30-60 days after their initial usage. This makes it incredibly hard to stick to a budget and forecast when charges will be due.

> "If a project is being closed down, it takes up to another month to really know about the open charges. So even if there isn't any consumption anymore, some charges do pop up." — Engineering Director, Enterprise

### Monitoring is limited & broken

The monitoring capabilities on IBM Cloud are very limited. Usage views are often useless to billing users because we separate their PaaS & IaaS charges, lack needed configuration options, and provide slow/inconsistent usage reporting from resources.

- Most users have to visit a minimum of 2 pages for a complete picture of their spending
- 1.9% of monthly billing visits to spending notifications page
- 27% task completion rate locating the forecast for next month's spending

> "I can't have a budget get blown out like that because I didn't realize these particular billing rules. That's why I've been trying to dig into different items and it's just really confusing." — CTO, SMB

### Navigating the billing experience is difficult

From redundant page titles, to confusing instructions, to poor performance, users have trouble finding, using and navigating the Cloud Billing UI. The visual hierarchy of many pages is disorienting, users are often met with dead ends or required to dig 4-5 levels deep to find what they're looking for.

- Overall system usability score (SUS) of 51

---

## Outcomes & Deliverables

We synthesized our findings into an easily digestible research artifact and presented to the Cloud organization, including PMs and VPs. The presentation focused on key pain points, supported by examples and customer feedback; outlining the potential (and realized) costs to the business. 

We also included design concepts and actionable approaches to tackling the identified issues and measuring success.

![Deliverables](/images/sob/deliverables.jpg)

This research was a foundational step in getting organizational buy-in around the challenges our billing users were facing on a daily basis. Before this project, the organization was relatively aimless in its approach to cloud billing and cost management. 

Equipped with a newfound understanding of our users, their goals and pain points, we were able to confidently identify and prioritize a project roadmap that would guide us for the following years.

- Prioritized 2020/21 IBM Cloud Billing vision and roadmap
- Synthesis of over 60+ user interviews into archetypes, JTBD and pain point themes
- Identification of 3 user archetypes
- Identification of 6 initial Jobs to Be Done
- Identification of 100+ billing pain points synthesized into 5 actionable themes
- Research used to identify and prioritize 10+ future billing projects
- Overall system usability score raised from 51 to 83 by addressing identified pain points
