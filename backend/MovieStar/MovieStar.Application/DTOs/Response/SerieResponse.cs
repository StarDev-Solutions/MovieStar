namespace MovieStar.Application.DTOs.Response
{
    public sealed record SerieResponse(
        Guid SerieId,
        string Nome,
        string Descricao,
        List<GeneroResponse> Generos,
        List<PersonagemResponse> Personagens,
        byte[]? Imagem,
        double Classificacao,
        string Origem,
        int FaixaEtaria,
        List<AvaliacaoSerieResponse>? Avaliacoes,
        List<TemporadaResponse>? Temporadas
        );
}
