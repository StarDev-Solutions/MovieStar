namespace MovieStar.Application.DTOs.Response
{
    public sealed record AvaliacaoFilmeResponse(
        Guid AvaliacaoId,
        Guid UsuarioId,
        string Comentario,
        int Nota,
        DateTime DataAvaliacao,
        FilmeResponse Serie);
}