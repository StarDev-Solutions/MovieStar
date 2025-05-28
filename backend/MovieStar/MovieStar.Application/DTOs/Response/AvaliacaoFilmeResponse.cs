namespace MovieStar.Application.DTOs.Response
{
    public sealed record AvaliacaoFilmeResponse(
        Guid AvaliacaoId,
        UsuarioResponse Usuario,
        string Comentario,
        int Nota,
        DateTime DataAvaliacao,
        FilmeResponse Serie);
}