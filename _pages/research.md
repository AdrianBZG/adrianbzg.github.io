---
layout: page
permalink: /research/
title: Research
years: [2024, 2023, 2022, 2021, 2020, 2019, 2018]
nav: true
sort_menu: 1
---
My research spans a wide range of topics around generative AI (particularly with Large Language Models and Diffusion Models), multimodality and applied research. 

I am particularly interested in <strong>(1)</strong> leveraging large language models (LLMs) and other foundational models to tackle both fundamental challenges and practical, real-world problems, <strong>(2)</strong> exploring modality alignment and the seamless integration of diverse data modalities, <strong>(3)</strong> developing more robust training methodologies, <strong>(4)</strong> improving model inference efficiency, and <strong>(5)</strong> pushing the boundaries of model alignment. My work is dedicated to creating innovative solutions that not only enhance the performance of AI systems but also contribute meaningfully to scientific discovery.

### Publications
Below is a list of my publications in reversed chronological order. 

<div class="publications">

<br/>
{% for y in page.years %}
  <div class="row m-0 p-0" style="border-top: 1px solid #ddd; flex-direction: row-reverse;">
    <div class="col-sm-1 mt-2 p-0 pr-1">
      <h3 class="bibliography-year">{{y}}</h3>
    </div>
    <div class="col-sm-11 p-0">
      {% bibliography -f papers -q @*[year={{y}}]* %}
    </div>
  </div>
{% endfor %}
