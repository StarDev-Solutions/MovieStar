using MovieStar.Domain.Entities;

namespace MovieStar.Domain.Repositories
{
    public interface IAvaliacaoRepository
    {
        Task<IEnumerable<Avaliacao>> GetAvaliacoesByFilmeIdAsync(Guid filmeId);
        Task<Avaliacao> GetAvaliacaoByIdAsync(Guid id);
        Task<Avaliacao> GetAvaliacaoByUserIdAsync(Guid userId);
        Task AddAvaliacaoAsync(Avaliacao avaliacao);
        Task UpdateAvaliacaoAsync(Avaliacao avaliacao);
        Task DeleteAvaliacaoAsync(int id);
    }
}