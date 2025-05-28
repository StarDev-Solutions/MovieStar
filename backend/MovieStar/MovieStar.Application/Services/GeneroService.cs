using MovieStar.Application.Contracts.Services;
using MovieStar.Application.DTOs.Request;
using MovieStar.Application.DTOs.Response;

namespace MovieStar.Application.Services
{
    public class GeneroService : IGeneroService
    {
        public Task AddAsync(GeneroRequest genero)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<GeneroResponse>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<GeneroResponse> GetByIdAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task UpdateAsync(GeneroRequest genero)
        {
            throw new NotImplementedException();
        }
    }
}
