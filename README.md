# CurvaABC

🚀 Transformando dados em insights estratégicos com SQL! 🚀

Este projeto envolve a classificação de produtos com base na Curva ABC, focado na análise de vendas e faturamento.

Utilizando SQL, criei CTEs (Common Table Expressions) para organizar o processo em etapas claras e reutilizar consultas intermediárias, o que melhorou a legibilidade e a manutenção do código. Além disso, utilizei Window Functions para calcular o percentual acumulado de faturamento por produto, sem a necessidade de subconsultas complexas, garantindo maior eficiência.

🔍 O processo foi dividido em três etapas principais:

Resumo de Vendas: Agregando as quantidades e valores totais vendidos por produto.
Percentual de Faturamento: Calculando a participação de cada produto no faturamento global.
Classificação ABC: Utilizando o percentual acumulado para classificar os produtos em A (mais relevantes), B e C, facilitando a priorização e otimização de estoque e vendas.
Por fim, criei uma view para que esses dados possam ser facilmente visualizados e trabalhados em um dashboard de data visualization.
