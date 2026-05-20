---
title: "Fixing Cloud Invoicing"
date: 2021-02-15
type: Project
draft: true
company: IBM Cloud
timeline: Dec 2019 – Feb 2021
role: Project Design Lead
collaborators: Justin Kruger, Hannah Moyers, Kristin Holifield, Tracey King, Mahendra Pingale
---

![Cover](/images/invoicing/cover.jpg)

## Roles and responsibilities

- **Led end-to-end design strategy:** Managed sprint planning, roadmaps, and stakeholder alignment presentations.
- **Drove cross-functional alignment:** Defined user needs through user stories and Jobs to Be Done (JTBD).
- **Partnered with Research:** Synthesized user interviews and data audits to inform design tasks.
- **Concepted & Tested:** Iterated on invoice page concepts based on user feedback.
- **Delivered High-Fidelity Design:** Produced final production-ready assets for the entire invoice experience.

---

## Project Background

The IBM Cloud Billing team had just completed the State of Billing research project—a design-led initiative to map our users' needs and primary friction points. Alongside an audit of the current experience, we synthesized a massive data set:
- **Qualitative:** 63 customer interviews and sessions with 6 Support & Success reps.
- **Quantitative:** 54 survey responses and 80 Usabilla/NPS comments.

<div class="emphasis">

The data showed that the <span class="accent">**invoice experience**</span> was the primary driver of user frustration and operational cost.
- **Direct Correlation:** 3 of 5 pain point themes related directly to invoicing.
- **Sentiment:** 22% of all negative NPS comments for IBM IaaS products cited the invoice experience.
- **Support Burden:** Support teams were fielding 1,000–1,600 billing tickets per month.
- **Financial Impact:** These issues accounted for approximately $1M/month in support costs.

</div>

---

## Project Overview

The invoice experience was identified as a primary user pain point during a platform-wide effort to unify disparate billing systems inherited through acquisitions. Because of this and the business impact we were able to demonstrate, getting stakeholder buy-in to fix the invoicing experience wasn't a challenge.

<div class="emphasis">

#### Team Goal
<span class="accent">Improve our NPS score</span> and <span class="accent">lower support costs</span> by addressing key gaps in our cloud invoicing experience.

</div>

#### Design Objectives

- **Understand:** Understand root cause of low NPS scores and high support costs.
- **Drive alignment:** Drive alignment around user needs and outcomes with collaborators across 3 distinct stakeholder organizations.
- **Design a solution:** Design a unified invoice reconciliation experience that addresses the billing user's core needs and pain points.

---

## Understanding the User

As part of the initial research we were able to refine our billing archetypes into a specific target user, identify their core use cases as it relates to invoicing, and map them back to our previously identified Jobs to Be Done.

### Cloud Cost <span class="accent">Leaders</span>
Leaders often manage entire organizations dedicated to optimizing cloud spend, which usually consist of analysts, developers, and finance experts**.

> "My focus is on helping our organization manage their current cloud spend, plan for future cloud spend, and proactively identify ways to optimize our cloud portfolio by using only what we need." — Cloud Optimization Lead, Enterprise

They are involved in the following jobs:
- Report spend for regular reports
- Maintain app availability (optimize costs)
- Send payments from the right place(s)
- Educate teams on new processes  (cost management focused processes only)

### Cloud Cost <span class="accent">Analysts</span>
Analysts either work on small teams focused on optimizing cloud costs, or are lone wolves. They frequently have a development background, and coordinate with dev teams to analyze their costs and make cuts.

> “Their [AWS] cloud explorer gives us recommendations on what our users usage and computation behavior is. From there, we define our automated budget policies.” - Data Science Manager, Enterprise, Technology

They are involved in the following jobs:
- Report spend for regular reports
- Maintain app availability (optimize costs)

### Cloud Cost <span class="accent">Advocates</span>
Advocates often have a day job as a developer focused on managing resources for themselves or others in their organization. They alone are not responsible for costs, but will often take it upon themselves to alert others when they are spending money on things they're no longer using.

> “I look up the owner and say, hey, over the last three months, this high compute device which you requested is not being used as expected. Then they can make the decision about what they're going to do about it.” - Network Engineer, Enterprise, Technology


They are involved in the following jobs:
- Maintain app availability (optimize costs)

---

### Quote to Cash Journey

The Quote to Cash journey is a reflection of the many stages our developers and billing users go through when paying for their usage. It starts with locating a service and ends with paying for their usage of the service, and ultimately how they manage their payment methods.

This project focused on improving a few specific stages in the overarching Quote to Cash journey: <span class="accent">Reconciling an invoice</span> (primary goal) and <span class="accent">Monitor usage</span> (related goal).

To help the team better understand the needs of our end-users I created a few ideal flows for each of these stages; marrying what I knew to be true about our technical requirements with the needs of the end user. These flows acted as a Northstar for the remainder of the effort.

![Quote to Cash Journey](/images/invoicing/quote-to-cash.jpg)

![Quote to Cash Journey - Monitor](/images/invoicing/q2c-journey-monitor.jpg)

![Quote to Cash Journey - Reconcile](/images/invoicing/q2c-journey-reconcile.jpg)

### Use Cases

Alongside the journey mapping, I worked with our Researcher and Product Manager to synthesize the findings from our interviews into specific use cases and validate them with our customers, ultimately connecting them back to our job statements.

![Reconcile invoice use cases](/images/invoicing/use-cases.jpg)

Similar to the ideal journey diagrams, these use cases would act as a critical measuring stick for the design work moving forward.

---

## Design Explorations

Equipped with an understanding of a billing user's goals, use cases and pain points, I spent early phases of design exploration mapping out flow concepts for the Reconcile an Invoice job. I focused initially on ways we might minimize the overall number of steps required by the user, while making improvements to things like the page naming and content hierarchy.

![Final selected flow concept](/images/invoicing/flow-exploration.jpg)

Once the flows had been mapped, I shifted my attention to improving the invoice and invoices page. To do this, I needed to gain a better understanding of the common attributes that make up an invoice, as well as how users expected to see their charges grouped.

### How should we organize the invoice?

I started by identifying the content that had to be on the invoice. At a base level, a cloud invoice can roughly be broken out into 3 sections: header, body, and footer.

Content in the header and footer is mostly straightforward, things like: billing period, account info and invoice details.

![Invoice sections](/images/invoicing/invoice-sections.jpg)

<div class="emphasis">
The real challenge lies in ensuring charges on the invoice are grouped in a way that makes sense to the user (body section).
</div>

### How are users actually billed?

During our interviews we learned that most users expect the charges on their invoice to map to their understanding of our billing model. Unfortunately, this often is not the case.

Unbeknownst to users there are multiple factors that go into the final charge they see on their invoice beyond the plan they've selected for a given service. To better understand this, I created a diagram that illustrates the factors that go into IBM Cloud's billing model.

![How services are billed on IBM Cloud](/images/invoicing/billing-model.jpg)

### How can we simplify this on the invoice?

After understanding the billing model, my next step was to determine the best way to group a user's charges in a way that meets their expectations. To accomplish this, I mapped out various approaches we could take ranging from most granular to least granular.

![Exploring how to group charges on the invoice](/images/invoicing/charge-grouping.jpg)

With an initial perspective on the potential approaches to organizing the charges on the invoice I started creating different explorations based on each one.

---

## Sketches & Design Iterations

Over the course of 6 months I went through 20+ iterations, making adjustments based on scope changes, feedback from Support Reps, the brand team and users.

![Invoice evolution based on continuous feedback loop](/images/invoicing/iterations.jpg)

Outside of the initial recommendations, a few additional improvements were identified in the sketching phase:

- Making the invoice number more prominent could help both users and support reps more quickly identify their invoice in a sea of numbers.
- The final invoice charge should be noticeable at a glance.
- Users really care about seeing their discounts.
- Charges from multiple months can appear on an invoice as an adjustment — this is a point of confusion for users as adjustments are currently grouped with all other charges.

---

## Usability Testing

After months of back and forth with our localization teams, developers and support, we were able to put together an invoice + invoice page prototype worthy of testing.

The concept tested ultimately grouped content by Service + Plan and then by Metric since providing Instance specific details would be out of scope, and separating the Plan from the service name was not possible for MVP.

![Charges grouped by Service + Plan and then by Metric](/images/invoicing/usability-test.jpg)

### Test Goals

- Can a user identify the total cost of the invoice?
- Can a user identify the cost of a specific service or metric?
- Can a user identify the billing period for a given invoice?
- Can a user locate an invoice in the Cloud UI for a specific billing period?
- Can a user identify an adjustment vs a charge in their current billing period?
- Can a user match charges on their invoice to the charges they see on the Cloud Usage dashboard for the same billing period?

### Test Learnings

- 30/30 participants were able to identify the total cost of the invoice.
- 30/30 participants were able to identify the cost of a specific service using the invoice.
- 27/30 participants were able to identify the invoice billing period.
- 25/30 participants understood the invoice was organized by service and plan.
- 23/30 participants understood the "Adjustments" section, recognizing those charges as usage that accrued in prior months.
- 30/30 participants were able to match charges on their invoice to charges seen on the Cloud Usage dashboard for the same billing period.
- 30/30 participants expected to see discounts broken out by service or metric.

---

## Finalizing the Design

I worked with our researcher to synthesize the feedback from the user interviews and translate into a final invoice template design and updated invoice page. Due to some technical scoping issues we were not able to address feedback related to line-item discounts and showing service instances; to be addressed in a future iteration.

Pictured below is an example of my final invoice template adopted for a US customer paying by Purchase Order. I worked extensively with the CIO office to ensure the template could be adapted to 18 different regions (and languages), any desired currency, and support both Purchase Order and Credit Card scenarios.

### Invoice Template
![Final invoice template](/images/invoicing/final-invoice.jpg)

#### Invoice Improvement Notes

- Single invoice template with consistent IBM Cloud branding.
- Template easily adjusted for any geo, currency, or payment type.
- Invoice number prominent at the top of every page for quick reference.
- Direct link from invoice to the IBM Cloud Usage dashboard, filtered for the same billing period.
- Improvements to invoice content hierarchy with specific sections for: invoice details, personal details, payment details, charges, adjustments, summary, and remittance details.
- Billing periods shifted to calendar months to match industry standards.
- Total due and payment methods front and center of page one.
- Charges grouped by Service, Plan and then Metric to help users better understand how they're being billed.
- Services show pre-tax, tax, and total charges.
- Separate section for adjustments to illustrate refunds and original invoice references.
- Summary section outlining totals and taxes that result in the final charge.

### Invoices Page Design

Along with the new invoice templates, I worked on delivering an overhaul of the Invoices page in the IBM Cloud Billing experience. Outside of the updated visuals and layout improvements, we were able to fix bugs with the existing page and implement a number of quality of life improvements.

![Final invoices page](/images/invoicing/final-invoices-page.jpg)

#### Invoice Page Improvement Notes

- Fixed the $0.00 invoice bug. All totals reflect the actual amount a user will be charged.
- Page no longer an iframe, allowing us to make layout and visual improvements.
- Page updated to use IBM Cloud components, updated to meet brand standards.
- Invoice number easily referenceable between the UI and invoice.
- Billing period clearly called out for each line item. Invoices sorted by billing period.
- Introduction of an "Invoice Type" attribute so users can more easily identify monthly charges, one-time charges, or adjustments.
- Improved and consolidated "Invoice Status" attribute. Clearly calls out which invoices have been paid and which ones are awaiting payment.
- New search and filter options let a user search for a specific invoice by invoice number, filter by invoice type and invoice status.
- Columns are sortable so that users can skim invoices by different attributes.
- Introduction of a "View usage" link that lets users view their usage dashboard and analyze charges in as much granularity as they might want.

## Impact

> "I can see everything (invoice totals) in one place now? Holy crap on a cracker, I'm a happy girl! Wow!" — Cloud Operations Lead, Enterprise Client

### Outcomes

- **Negative NPS comments directly referencing invoicing reduced by 18%** (From 22% to 4%).
- **Support tickets related to invoicing reduced by ~72%** (From 1000-1600 tickets per month to 250-450 tickets per month).
- **Support costs related to invoicing reduced by ~70%** (From ~$1M/month to ~$300k/month).
- New single, scalable invoice template to replace the 10+ existing invoice variations across the platform (From 10+ to 1).
- 97% of users stick with the new Invoices page as opposed to reverting to the old one.
- ~37% decrease in visits to the invoice detail pages (a sign the new invoice works!).
- 2nd Place winner of the IBM Finance and Operations Client Advocacy Award.
