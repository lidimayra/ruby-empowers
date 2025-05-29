Fabricator(:book) do
  title "Vida de Gato"
  language "Portuguese"
end

Fabricator(:english_book, from: :book) do
  language "English"
end

Fabricator(:available_book, from: :book) do
  quantity 5
end

Fabricator(:unavailable_book, from: :book) do
  quantity 0
end
