using MovieStar.Domain.Entities;

namespace MovieStar.Domain.Repositories
{
    public interface IAvaliacaoFilmeRepository
    {
        Task<AvaliacaoFilme> GetAvaliacaoByIdAsync(Guid avaliacaoId);
        Task<IEnumerable<AvaliacaoFilme>> GetAvaliacoesByFilmeIdAsync(Guid filmeId);
        Task<IEnumerable<AvaliacaoFilme>> GetAvaliacoesByUserIdAsync(Guid userId);
        Task AddAvaliacaoAsync(AvaliacaoFilme avaliacao);
        Task UpdateAvaliacaoAsync(AvaliacaoFilme avaliacao);
        Task DeleteAvaliacaoAsync(Guid avaliacaoId);
    }
}