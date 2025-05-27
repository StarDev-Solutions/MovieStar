using MovieStar.Domain.Entities;

namespace MovieStar.Domain.Interfaces
{
    public interface IPersonagemRepository
    {
        Task<Personagem> GetByIdAsync(Guid id);
        Task<IEnumerable<Personagem>> GetAllByActorNameAsync(string actorName);
        Task<IEnumerable<Personagem>> GetAllAsync();
        Task<IEnumerable<Personagem>> GetAllMovieIdAsync(Guid movieId);
        Task<IEnumerable<Personagem>> GetAllSeriesIdAsync(Guid seriesId);
        Task AddAsync(Personagem personagem);
        Task UpdateAsync(Personagem personagem);
        Task DeleteAsync(Guid id);
    }
}
