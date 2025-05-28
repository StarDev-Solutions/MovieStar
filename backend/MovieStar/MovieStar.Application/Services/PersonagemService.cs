using MovieStar.Application.Contracts.Services;
using MovieStar.Application.DTOs.Request;
using MovieStar.Application.DTOs.Response;

namespace MovieStar.Application.Services
{
    public class PersonagemService : IPersonagemService
    {
        public Task AddAsync(PersonagemRequest personagem)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<PersonagemResponse>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<PersonagemResponse> GetAllByActorNameAsync(string actorName)
        {
            throw new NotImplementedException();
        }

        public Task<PersonagemResponse> GetByIdAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task UpdateAsync(PersonagemRequest personagem)
        {
            throw new NotImplementedException();
        }
    }
}