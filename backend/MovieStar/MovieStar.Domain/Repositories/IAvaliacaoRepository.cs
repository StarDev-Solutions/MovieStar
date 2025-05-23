using MovieStar.Domain.Entities;

namespace MovieStar.Domain.Repositories
{
    public interface IAvaliacaoRepository
    {
        Task<IEnumerable<AvaliacaoFilme>> GetAvaliacoesByFilmeIdAsync(Guid filmeId);
        Task<AvaliacaoFilme> GetAvaliacaoByIdAsync(Guid id);
        Task<AvaliacaoFilme> GetAvaliacaoByUserIdAsync(Guid userId);
        Task AddAvaliacaoAsync(AvaliacaoFilme avaliacao);
        Task UpdateAvaliacaoAsync(AvaliacaoFilme avaliacao);
        Task DeleteAvaliacaoAsync(int id);
    }
}