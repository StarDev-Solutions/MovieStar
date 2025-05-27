using MovieStar.Domain.Entities;

namespace MovieStar.Domain.Interfaces
{
    public interface IGeneroRepository
    {
        Task<Genero> GetByIdAsync(Guid id);
        Task<IEnumerable<Genero>> GetAllAsync();
        Task AddAsync(Genero genero);
        Task UpdateAsync(Genero genero);
        Task DeleteAsync(Guid id);
    }
}
