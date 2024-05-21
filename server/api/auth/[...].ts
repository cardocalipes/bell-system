import { NuxtAuthHandler } from "#auth"
import GithubProvider from 'next-auth/providers/github'
export default NuxtAuthHandler({
    providers: [
        GithubProvider.default({
            clientId:'Ov23li9QULDKCMWyvWGF',
            clientSecret:'da0475fa465c75202c26ed7b2792fc4d1165a266'
        })
    ]
})