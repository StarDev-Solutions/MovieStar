namespace MovieStar.Application.DTOs.Response
{
    public sealed record AvaliacaoFilmeResponse(
        Guid AvaliacaoId,
        UsuarioResponse Usuario,
        string Comentario,
        double Nota,
        DateTime DataAvaliacao,
        FilmeResponse Serie);
}