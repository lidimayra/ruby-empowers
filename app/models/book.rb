class Book < ApplicationRecord

  # Espaço reservado para validações. Use o espaço abaixo para implementar a validação esperada
  # pelos testes
  validates :title, presence: true


  # Método vazio. Implemente aqui o comportamento esperado conforme os testes contidos no bloco
  # `describe "details"`
  def details
    publisher_name = publisher || "Unknown Publisher"

    title_and_publisher = "#{title} (#{publisher_name})"
    language ? "#{title_and_publisher} - #{language}" : title_and_publisher
  end
end
