using MovieStar.Application.Contracts.Services;
using MovieStar.Application.DTOs.Request;
using MovieStar.Application.DTOs.Response;
using MovieStar.Domain.Entities;

namespace MovieStar.Application.Services
{
    public class UsuarioService : IUsuarioService
    {
        public Task AddAsync(RegistroRequest usuario)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Usuario>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<UsuarioResponse> GetByEmailAsync(string email)
        {
            throw new NotImplementedException();
        }

        public Task UpdateAsync(RegistroRequest usuario)
        {
            throw new NotImplementedException();
        }
    }
}
