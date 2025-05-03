# Fundamentos MVC e idealização do projeto

O Rails é um framework que segue o padrão MVC (Model-View-Controller).
![MVC](./mvc.png)

Para o projeto que trabalharemos ao longo desse treinamento, gostaríamos de pensar no sistema web de
uma biblioteca.

Seguindo nessa linha, podemos imaginar que um dos principais recursos no sistema seria a
representação dos livros. Portanto, é assim que começamos o nosso sistema. Vamos pensar que `Book` é
o recurso inicial a ser trabalhado.

O model Book deverá conter as regras que esperamos que um elemento atenda para considerá-lo um
abstração boa o suficiente de um livro na nossa biblioteca.

As views podem ser utilizadas para definir o que queremos que seja exibido nas páginas do nosso
projeto. Listar livros, formulários de cadastro, exibição dos detalhes de cada livro, etc.

O controller é o responsável por expor as possibilidades para a interação entre as camadas,
possibilitando que os dados possam ser manuseados através de URLs. São os controllers que permitem
que os dados dos livros estejam disponíveis nas views.
