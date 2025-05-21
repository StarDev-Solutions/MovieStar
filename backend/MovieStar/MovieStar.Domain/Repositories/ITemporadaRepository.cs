using MovieStar.Domain.Entities;

namespace MovieStar.Domain.Repositories
{
    public interface ITemporadaRepository
    {
        Task<Temporada> GetByIdAsync(Guid id);
        Task<Temporada> GetByNumberAsync(int numer);
        Task<IEnumerable<Temporada>> GetAllAsync();
        Task AddAsync(Temporada temporada);
        Task UpdateAsync(Temporada temporada);
        Task DeleteAsync(int id);
    }
}